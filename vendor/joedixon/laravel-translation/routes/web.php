<?php


Route::group(config('translation.route_group_config') + ['namespace' => 'JoeDixon\\Translation\\Http\\Controllers'], function ($router)
{

	$router->get(config('translation.ui_url') . '/create', 'LanguageController@create')
		->name('languages.create');

	$router->post(config('translation.ui_url'), 'LanguageController@store')
		->name('languages.store');

	$router->get(config('translation.ui_url') . '/{language}', 'LanguageTranslationController@index')
		->name('languages.translations.index');

	$router->post(config('translation.ui_url') . '/{language}', 'LanguageTranslationController@update')
		->name('languages.translations.update');

});
