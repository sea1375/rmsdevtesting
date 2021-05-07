{{*
	Developed by Kernel Team
	http://kernel-team.com
	Version: 1.0
*}}

{{if is_array($list_messages)}}
	<div class="message">
	{{foreach item=item from=$list_messages|smarty:nodefaults}}
		<p>{{$item}}</p>
	{{/foreach}}
	</div>
{{/if}}

{{if $smarty.get.action=='add_new' || $smarty.get.action=='change'}}

{{if in_array('categories|edit_all',$smarty.session.permissions) || (in_array('categories|add',$smarty.session.permissions) && $smarty.get.action=='add_new')}}
	{{assign var=can_edit_all value=1}}
{{else}}
	{{assign var=can_edit_all value=0}}
{{/if}}

<form action="{{$page_name}}" method="post">
	<div class="err_list hidden">
		<div class="err_header"></div>
		<div class="err_content"></div>
	</div>
	<div>
		{{if $smarty.get.action=='add_new'}}
			<input type="hidden" name="action" value="add_new_complete"/>
		{{else}}
			<input type="hidden" name="action" value="change_complete"/>
			<input type="hidden" name="item_id" value="{{$smarty.get.item_id}}"/>
		{{/if}}
		{{if $options.CATEGORY_AVATAR_OPTION==0}}
			<input type="hidden" name="screenshot2" value="{{$smarty.post.screenshot2}}"/>
			<input type="hidden" name="screenshot2_hash"/>
		{{/if}}
		<input type="hidden" name="custom1" value="{{$smarty.post.custom1}}"/>
		<input type="hidden" name="custom2" value="{{$smarty.post.custom2}}"/>
		<input type="hidden" name="custom3" value="{{$smarty.post.custom3}}"/>
		<input type="hidden" name="custom4" value="{{$smarty.post.custom4}}"/>
		<input type="hidden" name="custom5" value="{{$smarty.post.custom5}}"/>
		<input type="hidden" name="custom6" value="{{$smarty.post.custom6}}"/>
		<input type="hidden" name="custom7" value="{{$smarty.post.custom7}}"/>
		<input type="hidden" name="custom8" value="{{$smarty.post.custom8}}"/>
		<input type="hidden" name="custom9" value="{{$smarty.post.custom9}}"/>
		<input type="hidden" name="custom10" value="{{$smarty.post.custom10}}"/>
		<input type="hidden" name="custom_file1" value="{{$smarty.post.custom_file1}}"/>
		<input type="hidden" name="custom_file1_hash"/>
		<input type="hidden" name="custom_file2" value="{{$smarty.post.custom_file2}}"/>
		<input type="hidden" name="custom_file2_hash"/>
		<input type="hidden" name="custom_file3" value="{{$smarty.post.custom_file3}}"/>
		<input type="hidden" name="custom_file3_hash"/>
		<input type="hidden" name="custom_file4" value="{{$smarty.post.custom_file4}}"/>
		<input type="hidden" name="custom_file4_hash"/>
		<input type="hidden" name="custom_file5" value="{{$smarty.post.custom_file5}}"/>
		<input type="hidden" name="custom_file5_hash"/>
	</div>
	<table class="de {{if $can_edit_all==0}}de_readonly{{/if}}">
		<colgroup>
			<col width="5%"/>
			<col width="95%"/>
		</colgroup>
		<tr>
			<td class="de_header" colspan="3">
				<div>
					<a href="{{$page_name}}">{{$lang.categorization.submenu_option_categories_list}}</a>
					/
					{{if $smarty.get.action=='add_new'}}
						{{$lang.categorization.category_add}}
					{{else}}
						{{if $smarty.post.category_group_id>0}}
							{{if in_array('category_groups|view',$smarty.session.permissions)}}
								<a href="categories_groups.php?action=change&amp;item_id={{$smarty.post.category_group_id}}">{{$smarty.post.category_group}}</a>
							{{else}}
								{{$smarty.post.category_group}}
							{{/if}}
							/
						{{/if}}
						{{$lang.categorization.category_edit|replace:"%1%":$smarty.post.title}}
					{{/if}}
				</div>
			</td>
		</tr>
		{{if $smarty.session.userdata.is_expert_mode==0 && $smarty.session.userdata.is_hide_forum_hints==0}}
			<tr>
				<td class="de_simple_text" colspan="2">
					<span class="de_hint">Forum: <a rel="external" href="https://forum.kernel-video-sharing.com/forum/educational-support/educational-series/543-categorization-best-practices">Categorization best practices</a></span>
				</td>
			</tr>
		{{/if}}
		{{if $options.ENABLE_CATEGORY_FIELD_1==1 || $options.ENABLE_CATEGORY_FIELD_2==1 || $options.ENABLE_CATEGORY_FIELD_3==1 || $options.ENABLE_CATEGORY_FIELD_4==1 || $options.ENABLE_CATEGORY_FIELD_5==1 || $options.ENABLE_CATEGORY_FIELD_6==1 || $options.ENABLE_CATEGORY_FIELD_7==1 || $options.ENABLE_CATEGORY_FIELD_8==1 || $options.ENABLE_CATEGORY_FIELD_9==1 || $options.ENABLE_CATEGORY_FIELD_10==1
				|| $options.ENABLE_CATEGORY_FILE_FIELD_1==1 || $options.ENABLE_CATEGORY_FILE_FIELD_2==1 || $options.ENABLE_CATEGORY_FILE_FIELD_3==1 || $options.ENABLE_CATEGORY_FILE_FIELD_4==1 || $options.ENABLE_CATEGORY_FILE_FIELD_5==1}}
			<tr>
				<td class="de_separator" colspan="3"><div>{{$lang.categorization.category_divider_general}}</div></td>
			</tr>
		{{/if}}
		<tr>
			<td class="de_label de_required">{{$lang.categorization.category_field_title}} (*):</td>
			<td class="de_control">
				<div class="de_str_len">
					<input type="text" name="title" maxlength="255" class="dyn_full_size" value="{{$smarty.post.title}}"/>
					{{if $smarty.session.userdata.is_expert_mode==0}}
						<br/><span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
					{{/if}}
				</div>
			</td>
			{{if is_array($sidebar_fields)}}
				{{assign var="sidebar_rowspan" value="7"}}
				{{if $options.CATEGORY_AVATAR_OPTION>0}}
					{{assign var="sidebar_rowspan" value=$sidebar_rowspan+1}}
				{{/if}}

				{{assign var="image_field" value=""}}
				{{if $smarty.post.screenshot1!=''}}
					{{assign var="image_field" value="screenshot1"}}
				{{/if}}
				{{if $options.CATEGORY_AVATAR_OPTION>0}}
					{{assign var="image_size1" value="x"|explode:$options.CATEGORY_AVATAR_SIZE}}
					{{assign var="image_size2" value="x"|explode:$options.CATEGORY_AVATAR_2_SIZE}}
					{{if ($image_size1[0]>$image_size2[0] || $smarty.post.screenshot1=='') && $smarty.post.screenshot2!=''}}
						{{assign var="image_field" value="screenshot2"}}
					{{/if}}
				{{/if}}
				{{if $image_field!=''}}
					{{assign var="sidebar_image_url" value="`$config.content_url_categories`/`$smarty.post.category_id`/`$smarty.post.$image_field`"}}
				{{/if}}

				{{include file="editor_sidebar_inc.tpl"}}
			{{/if}}
		</tr>
		{{if $smarty.get.action=='change'}}
			<tr>
				<td class="de_label">{{$lang.categorization.category_field_directory}}:</td>
				<td class="de_control">
					<input type="text" name="dir" maxlength="255" class="dyn_full_size" value="{{$smarty.post.dir}}"/>
					{{if $smarty.session.userdata.is_expert_mode==0}}
						<br/><span class="de_hint">{{$lang.categorization.category_field_directory_hint|replace:"%1%":$lang.categorization.category_field_title}}</span>
					{{/if}}
				</td>
			</tr>
		{{/if}}
		<tr>
			<td class="de_label">{{$lang.categorization.category_field_description}}:</td>
			<td class="de_control">
				<div class="de_str_len">
					<textarea name="description" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.description}}</textarea>
					{{if $smarty.session.userdata.is_expert_mode==0}}
						<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
					{{/if}}
				</div>
			</td>
		</tr>
		<tr>
			<td class="de_label">{{$lang.categorization.category_field_synonyms}}:</td>
			<td class="de_control">
				<textarea name="synonyms" class="dyn_full_size" cols="40" rows="4">{{$smarty.post.synonyms}}</textarea>
				{{if $smarty.session.userdata.is_expert_mode==0}}
					<br/><span class="de_hint">{{$lang.categorization.category_field_synonyms_hint}}</span>
				{{/if}}
			</td>
		</tr>
		<tr>
			<td class="de_label">{{$lang.categorization.category_field_status}}:</td>
			<td class="de_control">
				<div class="de_lv_pair"><input type="checkbox" name="status_id" value="1" {{if $smarty.post.status_id=='1'}}checked="checked"{{/if}}/><label>{{$lang.categorization.category_field_status_active}}</label></div>
				{{if $smarty.session.userdata.is_expert_mode==0}}
					<br/><span class="de_hint">{{$lang.categorization.category_field_status_hint}}</span>
				{{/if}}
			</td>
		</tr>
		<tr>
			<td class="de_label">{{$lang.categorization.category_field_group}}:</td>
			<td class="de_control">
				<select name="category_group_id">
					<option value="0">{{$lang.common.select_default_option}}</option>
					{{foreach item="item" from=$list_categories_groups|smarty:nodefaults}}
						<option value="{{$item.category_group_id}}" {{if $item.category_group_id==$smarty.post.category_group_id}}selected="selected"{{/if}}>{{$item.title}}</option>
					{{/foreach}}
				</select>
			</td>
		</tr>
		<tr>
			<td class="de_label">{{$lang.categorization.category_field_screenshot1}}:</td>
			<td class="de_control">
				<div class="de_fu">
					<div class="js_params">
						<span class="js_param">title={{$lang.categorization.category_field_screenshot1}}</span>
						<span class="js_param">accept={{$config.image_allowed_ext}}</span>
						{{if $smarty.get.action=='change' && $smarty.post.screenshot1!='' && in_array(end(explode(".",$smarty.post.screenshot1)),explode(",",$config.image_allowed_ext))}}
							<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.screenshot1}}</span>
						{{/if}}
					</div>
					<input type="text" name="screenshot1" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.screenshot1!=''}}value="{{$smarty.post.screenshot1}}"{{/if}} readonly="readonly"/>
					<input type="hidden" name="screenshot1_hash"/>
					{{if $can_edit_all==1 && $smarty.post.avatars_generation_enabled!=1}}
						<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
						<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.screenshot1==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
					{{/if}}
					{{if $smarty.get.action=='change' && $smarty.post.screenshot1!='' && in_array(end(explode(".",$smarty.post.screenshot1)),explode(",",$config.image_allowed_ext))}}
						<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
					{{/if}}
				</div>
				{{if $smarty.session.userdata.is_expert_mode==0}}
					<br/>
					<span class="de_hint">
						{{if $smarty.post.avatars_generation_enabled==1}}
							{{$lang.categorization.category_field_screenshot1_hint2}}
						{{else}}
							{{$lang.categorization.category_field_screenshot1_hint}} (<a href="options.php?page=general_settings">{{$options.CATEGORY_AVATAR_SIZE}}</a>)
						{{/if}}
					</span>
				{{/if}}
			</td>
		</tr>
		{{if $options.CATEGORY_AVATAR_OPTION>0}}
			<tr>
				<td class="de_label">{{$lang.categorization.category_field_screenshot2}}:</td>
				<td class="de_control">
					<div class="de_fu">
						<div class="js_params">
							<span class="js_param">title={{$lang.categorization.category_field_screenshot2}}</span>
							<span class="js_param">accept={{$config.image_allowed_ext}}</span>
							{{if $smarty.get.action=='change' && $smarty.post.screenshot2!='' && in_array(end(explode(".",$smarty.post.screenshot2)),explode(",",$config.image_allowed_ext))}}
								<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.screenshot2}}</span>
							{{/if}}
						</div>
						<input type="text" name="screenshot2" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.screenshot2!=''}}value="{{$smarty.post.screenshot2}}"{{/if}} readonly="readonly"/>
						<input type="hidden" name="screenshot2_hash"/>
						{{if $can_edit_all==1 && ($smarty.post.avatars_generation_enabled!=1 || $options.CATEGORY_AVATAR_OPTION!=1)}}
							<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
							<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.screenshot2==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
						{{/if}}
						{{if $smarty.get.action=='change' && $smarty.post.screenshot2!='' && in_array(end(explode(".",$smarty.post.screenshot2)),explode(",",$config.image_allowed_ext))}}
							<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
						{{/if}}
					</div>
					{{if $smarty.session.userdata.is_expert_mode==0}}
						<br/>
						<span class="de_hint">
							{{if $smarty.post.avatars_generation_enabled==1 && $options.CATEGORY_AVATAR_OPTION==1}}
								{{$lang.categorization.category_field_screenshot2_hint3}}
							{{else}}
								{{$lang.categorization.category_field_screenshot2_hint}} (<a href="options.php?page=general_settings">{{$options.CATEGORY_AVATAR_2_SIZE}}</a>){{if $options.CATEGORY_AVATAR_OPTION==1}}; {{$lang.categorization.category_field_screenshot2_hint2|replace:"%1%":$lang.categorization.category_field_screenshot1}}{{/if}}
							{{/if}}
						</span>
					{{/if}}
				</td>
			</tr>
		{{/if}}
		{{if $options.ENABLE_CATEGORY_FIELD_1==1 || $options.ENABLE_CATEGORY_FIELD_2==1 || $options.ENABLE_CATEGORY_FIELD_3==1 || $options.ENABLE_CATEGORY_FIELD_4==1 || $options.ENABLE_CATEGORY_FIELD_5==1 || $options.ENABLE_CATEGORY_FIELD_6==1 || $options.ENABLE_CATEGORY_FIELD_7==1 || $options.ENABLE_CATEGORY_FIELD_8==1 || $options.ENABLE_CATEGORY_FIELD_9==1 || $options.ENABLE_CATEGORY_FIELD_10==1
				|| $options.ENABLE_CATEGORY_FILE_FIELD_1==1 || $options.ENABLE_CATEGORY_FILE_FIELD_2==1 || $options.ENABLE_CATEGORY_FILE_FIELD_3==1 || $options.ENABLE_CATEGORY_FILE_FIELD_4==1 || $options.ENABLE_CATEGORY_FILE_FIELD_5==1}}
			<tr>
				<td class="de_separator" colspan="3"><div>{{$lang.categorization.category_divider_customization}}</div></td>
			</tr>
			{{if $options.ENABLE_CATEGORY_FIELD_1==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_1_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom1" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom1}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_2==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_2_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom2" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom2}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_3==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_3_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom3" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom3}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_4==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_4_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom4" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom4}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_5==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_5_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom5" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom5}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_6==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_6_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom6" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom6}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_7==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_7_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom7" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom7}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_8==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_8_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom8" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom8}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_9==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_9_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom9" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom9}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FIELD_10==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FIELD_10_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_str_len">
							<textarea name="custom10" class="dyn_full_size {{if $smarty.session.userdata.is_wysiwyg_enabled_other=='1'}}tinymce{{/if}}" cols="40" rows="4">{{$smarty.post.custom10}}</textarea>
							{{if $smarty.session.userdata.is_expert_mode==0}}
								<span class="de_hint"><span class="de_str_len_value"></span>{{$lang.common.symbols}}</span>
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FILE_FIELD_1==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FILE_FIELD_1_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_fu">
							<div class="js_params">
								<span class="js_param">title={{$options.CATEGORY_FILE_FIELD_1_NAME}}</span>
								{{if $smarty.get.action=='change' && $smarty.post.custom_file1!=''}}
									{{if in_array(end(explode(".",$smarty.post.custom_file1)),explode(",",$config.image_allowed_ext))}}
										<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file1}}</span>
									{{else}}
										<span class="js_param">download_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file1}}</span>
									{{/if}}
								{{/if}}
							</div>
							<input type="text" name="custom_file1" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.custom_file1!=''}}value="{{$smarty.post.custom_file1}}"{{/if}} readonly="readonly"/>
							<input type="hidden" name="custom_file1_hash"/>
							{{if $can_edit_all==1}}
								<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
								<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.custom_file1==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
							{{/if}}
							{{if $smarty.get.action=='change' && $smarty.post.custom_file1!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file1)),explode(",",$config.image_allowed_ext))}}
									<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
								{{else}}
									<input type="button" class="de_fu_download" value="{{$lang.common.attachment_btn_download}}"/>
								{{/if}}
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FILE_FIELD_2==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FILE_FIELD_2_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_fu">
							<div class="js_params">
								<span class="js_param">title={{$options.CATEGORY_FILE_FIELD_2_NAME}}</span>
								{{if $smarty.get.action=='change' && $smarty.post.custom_file2!=''}}
									{{if in_array(end(explode(".",$smarty.post.custom_file2)),explode(",",$config.image_allowed_ext))}}
										<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file2}}</span>
									{{else}}
										<span class="js_param">download_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file2}}</span>
									{{/if}}
								{{/if}}
							</div>
							<input type="text" name="custom_file2" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.custom_file2!=''}}value="{{$smarty.post.custom_file2}}"{{/if}} readonly="readonly"/>
							<input type="hidden" name="custom_file2_hash"/>
							{{if $can_edit_all==1}}
								<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
								<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.custom_file2==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
							{{/if}}
							{{if $smarty.get.action=='change' && $smarty.post.custom_file2!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file2)),explode(",",$config.image_allowed_ext))}}
									<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
								{{else}}
									<input type="button" class="de_fu_download" value="{{$lang.common.attachment_btn_download}}"/>
								{{/if}}
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FILE_FIELD_3==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FILE_FIELD_3_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_fu">
							<div class="js_params">
								<span class="js_param">title={{$options.CATEGORY_FILE_FIELD_3_NAME}}</span>
								{{if $smarty.get.action=='change' && $smarty.post.custom_file3!=''}}
									{{if in_array(end(explode(".",$smarty.post.custom_file3)),explode(",",$config.image_allowed_ext))}}
										<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file3}}</span>
									{{else}}
										<span class="js_param">download_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file3}}</span>
									{{/if}}
								{{/if}}
							</div>
							<input type="text" name="custom_file3" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.custom_file3!=''}}value="{{$smarty.post.custom_file3}}"{{/if}} readonly="readonly"/>
							<input type="hidden" name="custom_file3_hash"/>
							{{if $can_edit_all==1}}
								<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
								<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.custom_file3==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
							{{/if}}
							{{if $smarty.get.action=='change' && $smarty.post.custom_file3!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file3)),explode(",",$config.image_allowed_ext))}}
									<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
								{{else}}
									<input type="button" class="de_fu_download" value="{{$lang.common.attachment_btn_download}}"/>
								{{/if}}
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FILE_FIELD_4==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FILE_FIELD_4_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_fu">
							<div class="js_params">
								<span class="js_param">title={{$options.CATEGORY_FILE_FIELD_4_NAME}}</span>
								{{if $smarty.get.action=='change' && $smarty.post.custom_file4!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file4)),explode(",",$config.image_allowed_ext))}}
										<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file4}}</span>
									{{else}}
										<span class="js_param">download_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file4}}</span>
									{{/if}}
								{{/if}}
							</div>
							<input type="text" name="custom_file4" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.custom_file4!=''}}value="{{$smarty.post.custom_file4}}"{{/if}} readonly="readonly"/>
							<input type="hidden" name="custom_file4_hash"/>
							{{if $can_edit_all==1}}
								<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
								<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.custom_file4==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
							{{/if}}
							{{if $smarty.get.action=='change' && $smarty.post.custom_file4!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file4)),explode(",",$config.image_allowed_ext))}}
									<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
								{{else}}
									<input type="button" class="de_fu_download" value="{{$lang.common.attachment_btn_download}}"/>
								{{/if}}
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
			{{if $options.ENABLE_CATEGORY_FILE_FIELD_5==1}}
				<tr>
					<td class="de_label">{{$options.CATEGORY_FILE_FIELD_5_NAME}}:</td>
					<td class="de_control" colspan="2">
						<div class="de_fu">
							<div class="js_params">
								<span class="js_param">title={{$options.CATEGORY_FILE_FIELD_5_NAME}}</span>
								{{if $smarty.get.action=='change' && $smarty.post.custom_file5!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file5)),explode(",",$config.image_allowed_ext))}}
										<span class="js_param">preview_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file5}}</span>
									{{else}}
										<span class="js_param">download_url={{$config.content_url_categories}}/{{$smarty.post.category_id}}/{{$smarty.post.custom_file5}}</span>
									{{/if}}
								{{/if}}
							</div>
							<input type="text" name="custom_file5" class="fixed_500" maxlength="100" {{if $smarty.get.action=='change' && $smarty.post.custom_file5!=''}}value="{{$smarty.post.custom_file5}}"{{/if}} readonly="readonly"/>
							<input type="hidden" name="custom_file5_hash"/>
							{{if $can_edit_all==1}}
								<input type="button" class="de_fu_upload" value="{{$lang.common.attachment_btn_upload}}"/>
								<input type="button" class="de_fu_remove{{if $smarty.get.action=='add_new' || $smarty.post.custom_file5==''}} hidden{{/if}}" value="{{$lang.common.attachment_btn_remove}}"/>
							{{/if}}
							{{if $smarty.get.action=='change' && $smarty.post.custom_file5!=''}}
								{{if in_array(end(explode(".",$smarty.post.custom_file5)),explode(",",$config.image_allowed_ext))}}
									<input type="button" class="de_fu_preview" value="{{$lang.common.attachment_btn_preview}}"/>
								{{else}}
									<input type="button" class="de_fu_download" value="{{$lang.common.attachment_btn_download}}"/>
								{{/if}}
							{{/if}}
						</div>
					</td>
				</tr>
			{{/if}}
		{{/if}}
		{{if $can_edit_all==1}}
			<tr>
				<td class="de_action_group" colspan="3">
					{{if $smarty.get.action=='add_new'}}
						{{if $smarty.session.save.options.default_save_button==1}}
							<input type="submit" name="save_and_add" value="{{$lang.common.btn_save_and_add}}"/>
							<input type="submit" name="save_default" value="{{$lang.common.btn_save}}"/>
						{{else}}
							<input type="submit" name="save_default" value="{{$lang.common.btn_save}}"/>
							<input type="submit" name="save_and_add" value="{{$lang.common.btn_save_and_add}}"/>
						{{/if}}
					{{else}}
						{{if $smarty.session.save.options.default_save_button==1}}
							<input type="submit" name="save_and_edit" value="{{$lang.common.btn_save_and_edit_next}}"/>
							<input type="submit" name="save_and_stay" value="{{$lang.common.btn_save}}"/>
							<input type="submit" name="save_and_close" value="{{$lang.common.btn_save_and_close}}"/>
						{{else}}
							<input type="submit" name="save_and_stay" value="{{$lang.common.btn_save}}"/>
							<input type="submit" name="save_and_edit" value="{{$lang.common.btn_save_and_edit_next}}"/>
							<input type="submit" name="save_and_close" value="{{$lang.common.btn_save_and_close}}"/>
						{{/if}}
					{{/if}}
				</td>
			</tr>
		{{/if}}
	</table>
</form>

{{else}}

{{if in_array('categories|delete',$smarty.session.permissions)}}
	{{assign var=can_delete value=1}}
{{else}}
	{{assign var=can_delete value=0}}
{{/if}}
{{if in_array('categories|edit_all',$smarty.session.permissions)}}
	{{assign var=can_edit value=1}}
{{else}}
	{{assign var=can_edit value=0}}
{{/if}}
{{if in_array('system|administration',$smarty.session.permissions)}}
	{{assign var=can_see_audit_log value=1}}
{{else}}
	{{assign var=can_see_audit_log value=0}}
{{/if}}
{{if $can_delete==1 || $can_edit==1 || $can_see_audit_log==1}}
	{{assign var=can_invoke_additional value=1}}
{{else}}
	{{assign var=can_invoke_additional value=0}}
{{/if}}
{{if $can_delete==1 || $can_edit==1}}
	{{assign var=can_invoke_batch value=1}}
{{else}}
	{{assign var=can_invoke_batch value=0}}
{{/if}}

<div class="dg_wrapper">
	<form action="{{$page_name}}" method="get" class="form_dgf">
		<div class="dgf">
			<table>
				<tr>
					<td class="dgf_label">{{$lang.common.dg_filter_show_on_page}}:</td>
					<td class="dgf_control"><input type="text" name="num_on_page" size="3" value="{{$smarty.session.save.$page_name.num_on_page}}"/></td>
					<td class="dgf_label {{if $smarty.session.save.$page_name.se_text!=''}}dgf_selected{{/if}}">{{$lang.common.dg_filter_search}}:</td>
					<td class="dgf_control dgf_search">
						<input type="text" name="se_text" size="20" autocomplete="off" value="{{$smarty.session.save.$page_name.se_text}}"/>
						{{if count($search_fields)>0}}
							<div class="dgf_search_layer hidden">
								<span>{{$lang.common.dg_filter_search_in}}:</span>
								<ul>
									{{assign var="search_everywhere" value="true"}}
									{{foreach from=$search_fields|smarty:nodefaults item="field"}}
										<li>
											{{assign var="option_id" value="se_text_`$field.id`"}}
											<input type="hidden" name="{{$option_id}}" value="0"/>
											<div class="dg_lv_pair"><input type="checkbox" name="{{$option_id}}" value="1" {{if $smarty.session.save.$page_name[$option_id]==1}}checked="checked"{{/if}}/><label>{{$field.title}}</label></div>
											{{if $smarty.session.save.$page_name[$option_id]!=1}}
												{{assign var="search_everywhere" value="false"}}
											{{/if}}
										</li>
									{{/foreach}}
									<li class="dgf_everywhere">
										<div class="dg_lv_pair"><input type="checkbox" name="se_text_all" value="1" {{if $search_everywhere=='true'}}checked="checked"{{/if}} class="dgf_everywhere"/><label>{{$lang.common.dg_filter_search_in_everywhere}}</label></div>
									</li>
								</ul>
							</div>
						{{/if}}
					</td>
					<td class="dgf_control">
						<input type="submit" value="{{$lang.common.dg_filter_btn_submit}}"/>
						<input type="submit" name="reset_filter" value="{{$lang.common.dg_filter_btn_reset}}" {{if $smarty.session.save.$page_name.se_text=='' && $table_filtered==0}}disabled="disabled"{{/if}}/>
					</td>
					<td class="dgf_advanced_link">
						<a href="javascript:stub()" class="dgf_filters {{if $table_filtered==1}}dgf_selected{{/if}}">{{$lang.common.dg_filter_filters}}</a>
						<a href="javascript:stub()" class="dgf_columns">{{$lang.common.dg_filter_columns}}</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="dgf dgf_advanced_filters {{if $table_filtered==0}}hidden{{/if}}">
			<table class="dgf_filter">
				<tr>
					<td class="dgf_label {{if $smarty.session.save.$page_name.se_status_id!=''}}dgf_selected{{/if}}">{{$lang.categorization.category_field_status}}:</td>
					<td class="dgf_control">
						<select name="se_status_id">
							<option value="">{{$lang.common.dg_filter_option_all}}</option>
							<option value="1" {{if $smarty.session.save.$page_name.se_status_id=='1'}}selected="selected"{{/if}}>{{$lang.categorization.category_field_status_active}}</option>
							<option value="0" {{if $smarty.session.save.$page_name.se_status_id=='0'}}selected="selected"{{/if}}>{{$lang.categorization.category_field_status_disabled}}</option>
						</select>
					</td>
				</tr>
			</table>
			<table class="dgf_filter">
				<tr>
					<td class="dgf_label {{if $smarty.session.save.$page_name.se_category_group_id>0}}dgf_selected{{/if}}">{{$lang.categorization.category_field_group}}:</td>
					<td class="dgf_control">
						<select name="se_category_group_id">
							<option value="">{{$lang.common.dg_filter_option_all}}</option>
							{{foreach item="item" from=$list_categories_groups|smarty:nodefaults}}
								<option value="{{$item.category_group_id}}" {{if $item.category_group_id==$smarty.session.save.$page_name.se_category_group_id}}selected="selected"{{/if}}>{{$item.title}}</option>
							{{/foreach}}
						</select>
					</td>
				</tr>
			</table>
			<table class="dgf_filter">
				<tr>
					<td class="dgf_label {{if $smarty.session.save.$page_name.se_field!=''}}dgf_selected{{/if}}">{{$lang.common.dg_filter_field}}:</td>
					<td class="dgf_control">
						<select name="se_field">
							<option value="">{{$lang.common.dg_filter_option_all}}</option>
							<option value="empty/description" {{if $smarty.session.save.$page_name.se_field=="empty/description"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$lang.categorization.category_field_description}}</option>
							<option value="empty/synonyms" {{if $smarty.session.save.$page_name.se_field=="empty/synonyms"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$lang.categorization.category_field_synonyms}}</option>
							<option value="empty/group" {{if $smarty.session.save.$page_name.se_field=="empty/group"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$lang.categorization.category_field_group}}</option>
							<option value="empty/screenshot1" {{if $smarty.session.save.$page_name.se_field=="empty/screenshot1"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$lang.categorization.category_field_screenshot1}}</option>
							<option value="empty/screenshot2" {{if $smarty.session.save.$page_name.se_field=="empty/screenshot2"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$lang.categorization.category_field_screenshot2}}</option>
							{{section name="data" start="1" loop="11"}}
								{{assign var="custom_field_id" value="custom`$smarty.section.data.index`"}}
								{{assign var="custom_field_name_id" value="CATEGORY_FIELD_`$smarty.section.data.index`_NAME"}}
								{{assign var="custom_field_enable_id" value="ENABLE_CATEGORY_FIELD_`$smarty.section.data.index`"}}
								{{if $options[$custom_field_enable_id]==1}}
									<option value="empty/{{$custom_field_id}}" {{if $smarty.session.save.$page_name.se_field=="empty/`$custom_field_id`"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$options[$custom_field_name_id]}}</option>
								{{/if}}
							{{/section}}
							{{section name="data" start="1" loop="6"}}
								{{assign var="custom_field_id" value="custom_file`$smarty.section.data.index`"}}
								{{assign var="custom_field_name_id" value="CATEGORY_FILE_FIELD_`$smarty.section.data.index`_NAME"}}
								{{assign var="custom_field_enable_id" value="ENABLE_CATEGORY_FILE_FIELD_`$smarty.section.data.index`"}}
								{{if $options[$custom_field_enable_id]==1}}
									<option value="empty/{{$custom_field_id}}" {{if $smarty.session.save.$page_name.se_field=="empty/`$custom_field_id`"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_empty_field|replace:"%1%":$options[$custom_field_name_id]}}</option>
								{{/if}}
							{{/section}}
							<option value="filled/description" {{if $smarty.session.save.$page_name.se_field=="filled/description"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$lang.categorization.category_field_description}}</option>
							<option value="filled/synonyms" {{if $smarty.session.save.$page_name.se_field=="filled/synonyms"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$lang.categorization.category_field_synonyms}}</option>
							<option value="filled/group" {{if $smarty.session.save.$page_name.se_field=="filled/group"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$lang.categorization.category_field_group}}</option>
							<option value="filled/screenshot1" {{if $smarty.session.save.$page_name.se_field=="filled/screenshot1"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$lang.categorization.category_field_screenshot1}}</option>
							<option value="filled/screenshot2" {{if $smarty.session.save.$page_name.se_field=="filled/screenshot2"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$lang.categorization.category_field_screenshot2}}</option>
							{{section name="data" start="1" loop="11"}}
								{{assign var="custom_field_id" value="custom`$smarty.section.data.index`"}}
								{{assign var="custom_field_name_id" value="CATEGORY_FIELD_`$smarty.section.data.index`_NAME"}}
								{{assign var="custom_field_enable_id" value="ENABLE_CATEGORY_FIELD_`$smarty.section.data.index`"}}
								{{if $options[$custom_field_enable_id]==1}}
									<option value="filled/{{$custom_field_id}}" {{if $smarty.session.save.$page_name.se_field=="filled/`$custom_field_id`"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$options[$custom_field_name_id]}}</option>
								{{/if}}
							{{/section}}
							{{section name="data" start="1" loop="6"}}
								{{assign var="custom_field_id" value="custom_file`$smarty.section.data.index`"}}
								{{assign var="custom_field_name_id" value="CATEGORY_FILE_FIELD_`$smarty.section.data.index`_NAME"}}
								{{assign var="custom_field_enable_id" value="ENABLE_CATEGORY_FILE_FIELD_`$smarty.section.data.index`"}}
								{{if $options[$custom_field_enable_id]==1}}
									<option value="filled/{{$custom_field_id}}" {{if $smarty.session.save.$page_name.se_field=="filled/`$custom_field_id`"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_option_non_empty_field|replace:"%1%":$options[$custom_field_name_id]}}</option>
								{{/if}}
							{{/section}}
						</select>
					</td>
				</tr>
			</table>
			<table class="dgf_filter">
				<tr>
					<td class="dgf_label {{if $smarty.session.save.$page_name.se_usage!=''}}dgf_selected{{/if}}">{{$lang.common.dg_filter_usage}}:</td>
					<td class="dgf_control">
						<select name="se_usage">
							<option value="">{{$lang.common.dg_filter_option_all}}</option>
							<option value="used/videos" {{if $smarty.session.save.$page_name.se_usage=="used/videos"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_videos}}</option>
							<option value="used/albums" {{if $smarty.session.save.$page_name.se_usage=="used/albums"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_albums}}</option>
							<option value="used/posts" {{if $smarty.session.save.$page_name.se_usage=="used/posts"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_posts}}</option>
							<option value="used/other" {{if $smarty.session.save.$page_name.se_usage=="used/other"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_other}}</option>
							<option value="used/all" {{if $smarty.session.save.$page_name.se_usage=="used/all"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_any}}</option>
							<option value="notused/videos" {{if $smarty.session.save.$page_name.se_usage=="notused/videos"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_no_videos}}</option>
							<option value="notused/albums" {{if $smarty.session.save.$page_name.se_usage=="notused/albums"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_no_albums}}</option>
							<option value="notused/posts" {{if $smarty.session.save.$page_name.se_usage=="notused/posts"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_no_posts}}</option>
							<option value="notused/other" {{if $smarty.session.save.$page_name.se_usage=="notused/other"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_no_other}}</option>
							<option value="notused/all" {{if $smarty.session.save.$page_name.se_usage=="notused/all"}}selected="selected"{{/if}}>{{$lang.common.dg_filter_usage_no_any}}</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div class="dgf dgf_advanced_columns hidden">
			{{assign var="table_columns_display_mode" value="selector"}}
			{{include file="table_columns_inc.tpl"}}
		</div>
	</form>
	<form action="{{$page_name}}" method="post" class="form_dg">
		<div class="err_list hidden">
			<div class="err_header"></div>
			<div class="err_content"></div>
		</div>
		<div class="dg">
			<table>
				<colgroup>
					<col width="1%"/>
					{{assign var="table_columns_display_mode" value="sizes"}}
					{{include file="table_columns_inc.tpl"}}
					<col width="1%"/>
				</colgroup>
				<tr class="dg_header">
					<td class="dg_selector"><input type="checkbox" name="row_select[]" value="0" {{if $can_invoke_additional==0}}disabled="disabled"{{/if}}/></td>
					{{assign var="table_columns_display_mode" value="header"}}
					{{include file="table_columns_inc.tpl"}}
					<td>{{$lang.common.dg_actions}}</td>
				</tr>
				{{foreach name=data item=item from=$data|smarty:nodefaults}}
				<tr class="dg_data{{if $smarty.foreach.data.iteration % 2==0}} dg_even{{/if}} {{if $item.status_id==0}}disabled{{/if}}">
					<td class="dg_selector"><input type="checkbox" name="row_select[]" value="{{$item.$table_key_name}}" {{if $can_invoke_additional==0}}disabled="disabled"{{/if}}/></td>
					{{assign var="table_columns_display_mode" value="data"}}
					{{include file="table_columns_inc.tpl"}}
					<td>
						<a href="{{$page_name}}?action=change&amp;item_id={{$item.$table_key_name}}" class="edit" title="{{$lang.common.dg_actions_edit}}"></a>
						{{if $can_invoke_additional==1}}
							<a href="javascript:stub()" class="additional" title="{{$lang.common.dg_actions_additional}}">
								<span class="js_params">
									<span class="js_param">id={{$item.$table_key_name}}</span>
									<span class="js_param">name={{$item.title}}</span>
									{{if $item.status_id==0}}
										<span class="js_param">deactivate_hide=true</span>
									{{else}}
										<span class="js_param">activate_hide=true</span>
									{{/if}}
								</span>
							</a>
						{{/if}}
					</td>
				</tr>
				{{/foreach}}
			</table>
			{{if $can_invoke_additional==1}}
				<ul class="dg_additional_menu_template">
					{{if $can_delete==1}}
						<li class="js_params">
							<span class="js_param">href=?batch_action=delete&amp;row_select[]=${id}</span>
							<span class="js_param">title={{$lang.common.dg_actions_delete}}</span>
							<span class="js_param">confirm={{$lang.common.dg_actions_delete_confirm|replace:"%1%":'${name}'}}</span>
						</li>
					{{/if}}
					{{if $can_edit==1}}
						<li class="js_params">
							<span class="js_param">href=?batch_action=activate&amp;row_select[]=${id}</span>
							<span class="js_param">title={{$lang.common.dg_actions_activate}}</span>
							<span class="js_param">hide=${activate_hide}</span>
						</li>
						<li class="js_params">
							<span class="js_param">href=?batch_action=deactivate&amp;row_select[]=${id}</span>
							<span class="js_param">title={{$lang.common.dg_actions_deactivate}}</span>
							<span class="js_param">confirm={{$lang.common.dg_actions_deactivate_confirm|replace:"%1%":'${name}'}}</span>
							<span class="js_param">hide=${deactivate_hide}</span>
						</li>
					{{/if}}
					{{if $can_see_audit_log==1}}
						<li class="js_params">
							<span class="js_param">href=log_audit.php?no_filter=true&amp;se_object_type_id=6&amp;se_object_id=${id}</span>
							<span class="js_param">title={{$lang.common.dg_actions_additional_view_audit_log}}</span>
							<span class="js_param">plain_link=true</span>
						</li>
					{{/if}}
				</ul>
			{{/if}}
		</div>
		<div class="dgb">
			<table>
				<tr>
					{{if $can_invoke_batch==1}}
						<td class="dgb_label">{{$lang.common.dg_batch_actions}}:</td>
						<td class="dgb_control">
							<select name="batch_action">
								<option value="0">{{$lang.common.dg_batch_actions_select}}</option>
								{{if $can_delete==1}}
									<option value="delete">{{$lang.common.dg_batch_actions_delete}}</option>
								{{/if}}
								{{if $can_edit==1}}
									<option value="activate">{{$lang.common.dg_batch_actions_activate}}</option>
									<option value="deactivate">{{$lang.common.dg_batch_actions_deactivate}}</option>
								{{/if}}
							</select>
						</td>
						<td class="dgb_control">
							<input type="submit" value="{{$lang.common.dg_batch_actions_btn_execute}}" disabled="disabled"/>
						</td>
					{{/if}}
					{{if $can_edit==1}}
						{{foreach from=$table_fields|smarty:nodefaults item="field"}}
							{{if $field.type=='sorting' && $field.is_enabled==1}}
								<td class="dgb_control">
									<input type="submit" name="reorder" value="{{$lang.common.dg_actions_reorder}}"/>
								</td>
							{{/if}}
						{{/foreach}}
					{{/if}}
					<td class="dgb_list_stats">{{$lang.common.dg_list_stats|replace:"%1%":$total_num}}</td>
				</tr>
			</table>
			<ul class="dgb_actions_configuration">
				<li class="js_params">
					<span class="js_param">value=delete</span>
					<span class="js_param">confirm={{$lang.common.dg_batch_actions_delete_confirm|replace:"%1%":'${count}'}}</span>
				</li>
				<li class="js_params">
					<span class="js_param">value=deactivate</span>
					<span class="js_param">confirm={{$lang.common.dg_batch_actions_deactivate_confirm|replace:"%1%":'${count}'}}</span>
				</li>
			</ul>
		</div>
	</form>
</div>
{{include file="navigation.tpl"}}

{{/if}}