<!-- BEGIN: main -->
<!-- BEGIN: catnav -->
<div class="divbor1">
	<!-- BEGIN: loop -->
	{CAT_NAV}
	<!-- END: loop -->
</div>
<!-- END: catnav -->
<!-- BEGIN: data -->
<table class="tab1">
	<thead>
		<tr>
			<td style="width:40px;">{LANG.weight}</td>
			<td>{LANG.catalog_name}</td>
			<td align="center" style="width:120px;">{LANG.inhome}</td>
			<td>{LANG.viewcat_page}</td>
			<td align="center" style="width:90px;">{LANG.numlinks}</td>
			<td style="width:200px;">&nbsp;</td>
		</tr>
	</thead>
	<tbody>
		<!-- BEGIN: loop -->
		<tr>
			<td align="center">
			<select id="id_weight_{ROW.catid}" onchange="nv_chang_cat('{ROW.catid}','weight');">
				<!-- BEGIN: weight -->
				<option value="{WEIGHT.key}"{WEIGHT.selected}>{WEIGHT.title}</option>
				<!-- END: weight -->
			</select></td>
			<td><a href="{NV_BASE_ADMINURL}index.php?{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}=cat&amp;parentid={ROW.catid}"> <strong>{ROW.title}</strong> </a> {ROW.numsubcat} </td>
			<td align="center">
			<select id="id_inhome_{ROW.catid}" onchange="nv_chang_cat('{ROW.catid}','inhome');">
				<!-- BEGIN: inhome -->
				<option value="{INHOME.key}"{INHOME.selected}>{INHOME.title}</option>
				<!-- END: inhome -->
			</select></td>
			<td align="left">
			<select id="id_viewcat_{ROW.catid}" onchange="nv_chang_cat('{ROW.catid}','viewcat');">
				<!-- BEGIN: viewcat -->
				<option value="{VIEWCAT.key}"{VIEWCAT.selected}>{VIEWCAT.title}</option>
				<!-- END: viewcat -->
			</select></td>
			<td align="center">
			<select id="id_numlinks_{ROW.catid}" onchange="nv_chang_cat('{ROW.catid}','numlinks');">
				<!-- BEGIN: numlinks -->
				<option value="{NUMLINKS.key}"{NUMLINKS.selected}>{NUMLINKS.title}</option>
				<!-- END: numlinks -->
			</select></td>
			<td align="right">
				<a class="add_icon" href="{NV_BASE_ADMINURL}index.php?{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}=content&amp;catid={ROW.catid}&amp;parentid={ROW.parentid}">{LANG.content_add}</a>
				&nbsp; - 
				<a class="edit_icon" href="{NV_BASE_ADMINURL}index.php?{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}=cat&amp;catid={ROW.catid}&amp;parentid={ROW.parentid}#edit">{GLANG.edit}</a>
				&nbsp; - 
				<a class="delete_icon" href="javascript:void(0);" onclick="nv_del_cat({ROW.catid})">{GLANG.delete}</a>
			</td>
		</tr>
		<!-- END: loop -->
	</tbody>
</table>
<!-- END: data -->
<!-- END: main -->