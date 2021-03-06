<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }


    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }


    public function authWithGoogle()
    {
        try {
            $googleUser = Socialite::driver('google')->stateless()->user();

            $user = User::where('email', $googleUser->email)->first();
            if ($user) {
                if ($user->status == '1') {
                    if ($user->avatar == null) {
                        $user->avatar = $googleUser->avatar;
                        $user->save();
                    }
                    $user->google_id = $googleUser->id;
                    $user->google_token = $googleUser->token;
                    $user->save();

                    Auth::login($user);
                    return redirect('home');
                } else {
                    return redirect('/')->with('errorAuthGoogle', 'El usuario se encuentra inhabilitado.');
                }
            } else {
                return redirect('/')->with('errorAuthGoogle', 'No se encontr?? el usuario.');
            }
        } catch (Throwable  $e) {
            return redirect('/');
        }
    }
}
