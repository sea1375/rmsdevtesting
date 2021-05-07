<?php /* Smarty version 2.6.31, created on 2021-04-08 19:13:37
         compiled from content_list.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('insert', 'getBlock', 'content_list.tpl', 1, false),array('insert', 'getGlobal', 'content_list.tpl', 52, false),array('modifier', 'escape_ss', 'content_list.tpl', 2, false),array('modifier', 'replace_tokens', 'content_list.tpl', 7, false),array('modifier', 'replace', 'content_list.tpl', 10, false),)), $this); ?>
<?php require_once(SMARTY_CORE_DIR . 'core.run_insert_handler.php');
echo smarty_core_run_insert_handler(array('args' => array('name' => 'getBlock', 'block_id' => 'custom_list_videos', 'block_name' => 'Common Videos Content List', 'assign' => 'common_videos_content_list_result')), $this); ?>

<?php if (((is_array($_tmp=$this->_tpl_vars['lang']['enable_albums'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) == 'true'): ?>
	<?php require_once(SMARTY_CORE_DIR . 'core.run_insert_handler.php');
echo smarty_core_run_insert_handler(array('args' => array('name' => 'getBlock', 'block_id' => 'list_albums', 'block_name' => 'Common Albums Content List', 'assign' => 'common_albums_content_list_result')), $this); ?>

<?php endif; ?>

<?php if (((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['list_type'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) == 'tags'): ?>
	<?php $this->assign('page_title', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_tag_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_description', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_tag_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_keywords', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_tag_keywords'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_canonical', ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['urls']['content_by_tag'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace', true, $_tmp, "%DIR%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info']['tag_dir'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%DIR%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info']['tag_dir'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))))) ? $this->_run_mod_handler('replace', true, $_tmp, "%ID%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info']['tag_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%ID%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['tag_info']['tag_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>

<?php elseif (((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['list_type'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) == 'categories'): ?>
	<?php $this->assign('page_title', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_category_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_description', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_category_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_keywords', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_category_keywords'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_canonical', ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['urls']['content_by_category'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace', true, $_tmp, "%DIR%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info']['dir'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%DIR%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info']['dir'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))))) ? $this->_run_mod_handler('replace', true, $_tmp, "%ID%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info']['category_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%ID%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['category_info']['category_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>

<?php elseif (((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['list_type'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) == 'models'): ?>
	<?php $this->assign('page_title', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_model_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_description', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_model_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_keywords', ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_by_model_keywords'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace_tokens', true, $_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace_tokens($_tmp, ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php $this->assign('page_canonical', ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['urls']['content_by_model'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace', true, $_tmp, "%DIR%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info']['dir'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%DIR%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info']['dir'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))))) ? $this->_run_mod_handler('replace', true, $_tmp, "%ID%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info']['model_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%ID%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['model_info']['model_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>

<?php else: ?>
	<?php $this->assign('page_title', ((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))); ?>
	<?php $this->assign('page_description', ((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))); ?>
	<?php $this->assign('page_keywords', ((is_array($_tmp=$this->_tpl_vars['lang']['html']['content_keywords'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))); ?>
	<?php $this->assign('page_next', ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_next'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))); ?>
	<?php $this->assign('page_prev', ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_prev'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))); ?>
	<?php $this->assign('page_canonical', ((is_array($_tmp=$this->_tpl_vars['lang']['urls']['content'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))); ?>

<?php endif; ?>

<?php if (((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_now'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) > 1): ?>
	<?php if (((is_array($_tmp=$this->_tpl_vars['page_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) != ''): ?>
		<?php $this->assign('page_title', ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['default_paginated_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace', true, $_tmp, "%1%", ((is_array($_tmp=$this->_tpl_vars['page_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%1%", ((is_array($_tmp=$this->_tpl_vars['page_title'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))))) ? $this->_run_mod_handler('replace', true, $_tmp, "%2%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_now'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%2%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_now'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php endif; ?>
	<?php if (((is_array($_tmp=$this->_tpl_vars['page_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) != ''): ?>
		<?php $this->assign('page_description', ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['lang']['html']['default_paginated_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))) ? $this->_run_mod_handler('replace', true, $_tmp, "%1%", ((is_array($_tmp=$this->_tpl_vars['page_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%1%", ((is_array($_tmp=$this->_tpl_vars['page_description'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)))))) ? $this->_run_mod_handler('replace', true, $_tmp, "%2%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_now'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))) : smarty_modifier_replace($_tmp, "%2%", ((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['page_now'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp))))); ?>
	<?php endif; ?>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "include_header_general.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php if (((is_array($_tmp=$this->_tpl_vars['storage']['custom_list_videos_common_videos_content_list']['list_type'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) == 'models'): ?>
	<?php require_once(SMARTY_CORE_DIR . 'core.run_insert_handler.php');
echo smarty_core_run_insert_handler(array('args' => array('name' => 'getBlock', 'block_id' => 'model_view', 'block_name' => 'Model View')), $this); ?>

	<?php require_once(SMARTY_CORE_DIR . 'core.run_insert_handler.php');
echo smarty_core_run_insert_handler(array('args' => array('name' => 'getBlock', 'block_id' => 'model_comments', 'block_name' => 'Model Comments')), $this); ?>

<?php endif; ?>

<?php echo $this->_tpl_vars['common_videos_content_list_result']; ?>

<?php if (((is_array($_tmp=$_SESSION['status_id'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) != 3): ?>
	<?php require_once(SMARTY_CORE_DIR . 'core.run_insert_handler.php');
echo smarty_core_run_insert_handler(array('args' => array('name' => 'getGlobal', 'global_id' => 'global_stats_banner')), $this); ?>

<?php endif; ?>

<?php if (((is_array($_tmp=$this->_tpl_vars['lang']['enable_albums'])) ? $this->_run_mod_handler('escape_ss', true, $_tmp) : smarty_modifier_escape_ss($_tmp)) == 'true'): ?>
	<?php echo $this->_tpl_vars['common_albums_content_list_result']; ?>

	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "include_join_banner_2.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "include_footer_general.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>