<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 2-9-2010 14:43
 */

if( ! defined( 'NV_IS_FILE_ADMIN' ) ) die( 'Stop!!!' );

$page_title = $lang_module['comment'];

$xtpl = new XTemplate( "comments.tpl", NV_ROOTDIR . "/themes/" . $global_config['module_theme'] . "/modules/" . $module_file );
$xtpl->assign( 'LANG', $lang_module );
$xtpl->assign( 'GLANG', $lang_global );
$xtpl->assign( 'NV_BASE_ADMINURL', NV_BASE_ADMINURL );
$xtpl->assign( 'NV_NAME_VARIABLE', NV_NAME_VARIABLE );
$xtpl->assign( 'NV_OP_VARIABLE', NV_OP_VARIABLE );
$xtpl->assign( 'MODULE_NAME', $module_name );

$per_page = 15;
$page = $nv_Request->get_int( 'page', 'get', 0 );
$base_url = NV_BASE_ADMINURL . "index.php?" . NV_NAME_VARIABLE . "=" . $module_name . "&amp;" . NV_OP_VARIABLE . "=" . $op;

$sql = "" . $db_config['prefix'] . "_" . $module_data . "_comments_" . NV_LANG_DATA . " a LEFT JOIN " . $db_config['prefix'] . "_" . $module_data . "_rows b ON a.id=b.id";
$all_page = $db->query( "SELECT COUNT(*) FROM " . $sql )->fetchColumn();

$db->sqlreset()->select( "a.cid, a.content, a.post_email, a.status, b." . NV_LANG_DATA . "_title" )->from( $sql )->where( 'a.status =1' )->order( 'cid DESC' )->limit( $per_page )->offset( $page );

$result = $db->query( $db->sql() );

$i = 1;
while( list( $cid, $content, $email, $status, $title ) = $result->fetch( 3 ) )
{
	$xtpl->assign( 'ROW', array(
		"class" => $i++ % 2 == 0 ? " class=\"second\"" : "",
		"cid" => $cid,
		"content" => $content,
		"email" => $email,
		"title" => $title,
		"status" => ( $status == 1 ) ? $lang_module['comment_enable'] : $lang_module['comment_disable']
	) );
	$xtpl->parse( 'main.loop' );
}

$generate_page = nv_generate_page( $base_url, $all_page, $per_page, $page );

if( ! empty( $generate_page ) )
{
	$xtpl->assign( "GENERATE_PAGE", $generate_page );
	$xtpl->parse( 'main.generate_page' );
}

$xtpl->parse( 'main' );
$contents = $xtpl->text( 'main' );

include NV_ROOTDIR . '/includes/header.php';
echo nv_admin_theme( $contents );
include NV_ROOTDIR . '/includes/footer.php';

?>