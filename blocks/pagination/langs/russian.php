<?php
/* Developed by Kernel Team.
   http://kernel-team.com
*/

// =====================================================================================================================
// pagination messages
// =====================================================================================================================

$lang['pagination']['params']['links_per_page']         = "Устанавливает максимальное кол-во ссылок пагинации, видимых на одной странице (страница 1, страница 2, и т.д.).";
$lang['pagination']['params']['related_block_ext_id']   = "Ссылка на блок листинга, для которого предназначен данный блок пагинации. Блок листинга должен быть указан выше на этой странице.";
$lang['pagination']['params']['url_prefix']             = "Префикс, который будет использоваться в ссылках на страницы.";
$lang['pagination']['params']['se_friendly']            = "Включает генерацию удобных для поисковых роботов ссылок пагинации.";

$lang['pagination']['block_short_desc'] = "Предоставляет функционал пагинации для любого блока листинга";

$lang['pagination']['block_desc'] = "
	Блок отображает страницы для любого блока листинга, в котором включена поддержка пагинации
	(установлен параметр блока листинга [kt|b]var_from[/kt|b]).
	[kt|br][kt|br]

	Начиная с версии 1.5.0 все блоки листинга позволяют использовать пагинацию внутри самих блоков.
	Отдельный блок пагинации следует использовать только тогда, когда нужно иметь пагинацию, ведущую на список,
	находящийся на другой странице (параметр блока [kt|b]url_prefix[/kt|b]).
	[kt|br][kt|br]

	[kt|b]Опции отображения и логика[/kt|b]
	[kt|br][kt|br]

	Связанный блок листинга, для которого данным блоком отображается пагинация, задается параметром
	блока [kt|b]related_block_ext_id[/kt|b].
	[kt|br][kt|br]

	Если вы хотите, чтобы при использовании ссылок пагинации пользователь уходил на список, находящийся
	на другой странице (например, блок пагинации отображается на странице index.php, а ссылки ведут на
	страницу top_rated_videos.php), вам следует использовать параметр блока [kt|b]url_prefix[/kt|b], в
	котором задается префикс для всех ссылок пагинации с символом вопроса на конце (в данном примере это
	[kt|b]/top_rated_videos.php?[/kt|b]).
	[kt|br][kt|br]

	[kt|b]Кэширование[/kt|b]
	[kt|br][kt|br]

	Кэширование блока зависит от связанного с ним блока листинга. Время жизни кэша в данном блоке
	пагинации должно быть установлено такое же, как и в связанном блоке листинга.
";

?>