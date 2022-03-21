<?php

namespace JoeDixon\Translation\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use JoeDixon\Translation\Drivers\Translation;

class LanguageTranslationController extends Controller {

	private $translation;

	public function __construct(Translation $translation)
	{
		$this->translation = $translation;
	}

	public function index(Request $request, $language)
	{
		// dd($this->translation->getSingleTranslationsFor('en'));

		if (Auth::check())
		{
			if (\auth()->user()->can('access-language'))
			{
				if ($request->has('language') && $request->get('language') !== $language)
				{
					return redirect()
						->route('languages.translations.index', ['language' => $request->get('language'), 'group' => $request->get('group'), 'filter' => $request->get('filter')]);
				}

				$languages = $this->translation->allLanguages();

				$groups = $this->translation->getGroupsFor(config('app.locale'))->merge('single');
				$translations = $this->translation->filterTranslationsFor($language, $request->get('filter'));

				if ($request->has('group') && $request->get('group'))
				{
					if ($request->get('group') === 'single')
					{
						$translations = $translations->get('single');
						$translations = new Collection(['single' => $translations]);
					} else
					{
						$translations = $translations->get('group')->filter(function ($values, $group) use ($request)
						{
							return $group === $request->get('group');
						});

						$translations = new Collection(['group' => $translations]);
					}
				}


				return view('translation::languages.translations.index', compact('language', 'languages', 'groups', 'translations'));
			} else
			{
				return abort('403', __('You are not authorized'));

			}
		}

		return redirect('login');
	}

	public function update(Request $request, $language)
	{
		if (Auth::check())
		{
			if (\auth()->user()->can('access-language'))
			{
				if (!Str::contains($request->get('group'), 'single'))
				{
					$this->translation->addGroupTranslation($language, $request->get('group'), $request->get('key'), $request->get('value') ?: '');
				} else
				{
					$this->translation->addSingleTranslation($language, $request->get('group'), $request->get('key'), $request->get('value') ?: '');
				}

				return ['success' => true];
			} else
			{
				return abort('403', __('You are not authorized'));
			}
		}
		return redirect('login');
	}
}


