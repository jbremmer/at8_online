<!-- src/routes/register.svelte -->
<script>
	// core components
	// const github = '/img/github.svg';
	// const google = '/img/google.svg';

	import '../app.postcss';
	import SkcoLogo from '$lib/logo.svelte';
	const pageBackground = '/img/at8_date.jpg';

	import { browser } from '$app/env';
	const qs = browser ? document.location.search : '';
	const query = new URLSearchParams(qs);
	const registrationParam = query.get('registration') || 'unknown';

	let email = '';
	let password = '';

	let loginError;
	import { writable } from 'svelte/store';
	import { SCKO_API_BASE } from '$lib/env.js';

	export const store = writable(null);
	function handleSubmit() {
		loginError = false;

		const requestOptions = {
			method: 'POST',
			// mode: 'cors',
			headers: {
				'Content-Type': 'application/x-www-form-urlencoded'
			},
			body: `email=${email}&password=${password}`
		};
		// console.log(requestOptions);
		fetch(`${SCKO_API_BASE}/auth/login`, requestOptions)
			.then(async (response) => {
				return await response.json();
			})
			.then((authentication) => {
				// console.log(data);
				if (authentication && authentication.user && authentication.user.aud === 'authenticated') {
					$store = authentication;
					window.location.href = '/app';
				}
			})
			.catch((error) => {
				loginError = error;
				console.error(error);
			});
	}
</script>

<svelte:head>
	<title>Login | at8.online</title>
</svelte:head>

<div>
	<main>
		<section class="relative w-full h-full py-40 min-h-screen flex items-center justify-center">
			<div
				class="absolute top-0 w-full h-full bg-blueGray-800 bg-no-repeat bg-cover bg-center bg-blend-soft-light -z-50"
				style="background-image: url({pageBackground});"
			/>
			<div class="container mx-auto px-4 h-full ">
				<div
					class="w-full max-w-sm p-6 m-auto bg-gray-900 rounded-md shadow-lg dark:bg-gray-800 bg-opacity-20"
				>
					<div class="flex mb-3 pb-10 justify-center">
						<SkcoLogo logofill="white" />
					</div>

					{#if registrationParam === 'completed'}
						<p class="text-gray-200">Your registration is completed, you may login now.</p>
					{/if}

					{#if loginError}
						<p class="text-gray-200">{loginError.message}</p>
					{/if}

					<form class="mt-6" on:submit|preventDefault={handleSubmit}>
						<div>
							<label for="username" class="block text-sm text-gray-200 dark:text-gray-200"
								>Username</label
							>
							<input
								type="email"
								bind:value={email}
								tabindex="1"
								class="block w-full px-4 py-2 mt-2 light:text-gray-700 light:bg-white border border-gray-300 rounded-md bg-gray-800 text-gray-300 border-gray-600 light:focus:border-amber-500 focus:border-pink-900 focus:outline-none focus:ring-pink-900"
							/>
						</div>

						<div class="mt-4">
							<div class="flex items-center justify-between">
								<label for="password" class="block text-sm light:text-gray-800 text-gray-200"
									>Password</label
								>
								<a
									tabindex="5"
									href="/forgot-password"
									class="text-xs text-gray-500 dark:text-gray-400 hover:underline focus:outline-none focus:text-pink-400 hover:text-pink-400"
									>Forgot Password?</a
								>
							</div>

							<input
								type="password"
								bind:value={password}
								tabindex="2"
								class="block w-full px-4 py-2 mt-2 light:text-gray-700 light:bg-white border border-gray-300 rounded-md bg-gray-800 text-gray-300 border-gray-600 light:focus:border-amber-500 focus:border-pink-900 focus:outline-none focus:ring-pink-900"
							/>
						</div>

						<div class="mt-6">
							<button
								tabindex="3"
								class="w-full px-4 py-2 tracking-wide text-white transition-colors duration-200 transform bg-pink-800 rounded-md hover:bg-pink-700 focus:outline-none focus:bg-pink-700"
							>
								Login
							</button>
						</div>
					</form>

					<p class="mt-8 text-xs text-center text-gray-300">
						Don't have an account? <a
							href="/register"
							tabindex="4"
							class="font-medium light:text-gray-800 text-gray-100 hover:underline focus:outline-none focus:text-pink-400 hover:text-pink-400"
							>Create One</a
						>
					</p>
				</div>
			</div>
		</section>
	</main>
</div>
