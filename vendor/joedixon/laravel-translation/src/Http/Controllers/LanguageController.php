<?php

namespace JoeDixon\Translation\Http\Controllers;

use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use JoeDixon\Translation\Drivers\Translation;
use JoeDixon\Translation\Http\Requests\LanguageRequest;

class LanguageController extends Controller {

	private $translation;

	public function __construct(Translation $translation)
	{
		$this->translation = $translation;
	}


	public function create()
	{
		if (Auth::check())
		{
			if (\auth()->user()->can('access-language'))
			{
				$languages = $this->translation->allLanguages();

				return view('translation::languages.create', compact('languages'));

			} else
			{
				return abort('403', __('You are not authorized'));

			}
		}

		return redirect('login');
	}

	public function store(LanguageRequest $request)
	{

		if (Auth::check())
		{
			if (\auth()->user()->can('access-language'))
			{
				$this->translation->addLanguage($request->locale, $request->name);

				return redirect()
					->route('languages.translations.index', $request->locale)
					->with('success', __('translation::translation.language_added'));
			} else
			{
				return abort('403', __('You are not authorized'));

			}
		}
		return redirect('login');
	}
}
