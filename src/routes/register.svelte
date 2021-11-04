<!-- src/routes/register.svelte -->
<script>
	// core components
	// const github = '/img/github.svg';
	// const google = '/img/google.svg';

	import '../app.postcss';
	import { SCKO_API_BASE } from '$lib/env.js';
	import SkcoLogo from '$lib/logo.svelte';
	const pageBackground = '/img/at8_date.jpg';
</script>

<svelte:head>
	<title>Register | at8.online</title>
</svelte:head>

<div>
	<main>
		<section class="relative w-full h-full py-40 min-h-screen flex items-center justify-center">
			<div
				class="absolute top-0 w-full h-full bg-blueGray-800 bg-no-repeat bg-cover bg-center bg-blend-soft-light"
				style="background-image: url({pageBackground});"
			/>
			<div class="container mx-auto px-4 h-full">
				<div class="flex content-center items-center justify-center h-full">
					<div class="w-full lg:w-6/12 px-4">
						<div
							class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-gray-900 dark:bg-gray-800 bg-opacity-20 border-0"
						>
							<div class="rounded-t mb-0 px-6 py-6">
								<div class="flex mb-3 pt-16 pb-10 justify-center">
									<SkcoLogo logofill="white" />
								</div>
							</div>

							<div class="flex-auto px-4 lg:px-10 py-10 pt-0">
								<div class="text-blueGray-200 text-center mb-3 font-bold">
									<small>Sign up with credentials</small>
								</div>
								<form action="{SCKO_API_BASE}/auth/register" method="POST">
									<input type="hidden" name="skcowr" value="2b260af93bfce68106f72dea8e17ecbd" />
									<div class="relative w-full mb-3">
										<label
											for="email"
											class="uppercase block text-sm text-gray-200 dark:text-gray-200 font-bold"
											>Email</label
										>
										<input
											name="email"
											type="email"
											tabindex="1"
											class="block w-full px-4 py-2 mt-2 light:text-gray-700 light:bg-white border border-gray-300 rounded-md bg-gray-800 text-gray-300 border-gray-600 light:focus:border-amber-500 focus:border-pink-900 focus:outline-none focus:ring-pink-900"
										/>
									</div>

									<div class="relative w-full mb-3">
										<label
											class="block uppercase text-blueGray-100 text-xs font-bold mb-2"
											for="grid-password"
										>
											Password
										</label>
										<input
											id="grid-password"
											name="password"
											required
											type="password"
											class="block w-full px-4 py-2 mt-2 light:text-gray-700 light:bg-white border border-gray-300 rounded-md bg-gray-800 text-gray-300 border-gray-600 light:focus:border-amber-500 focus:border-pink-900 focus:outline-none focus:ring-pink-900"
											placeholder="Password"
										/>
									</div>

									<div>
										<label class="inline-flex items-center cursor-pointer">
											<input
												id="customCheckLogin"
												type="checkbox"
												class="form-checkbox border-0 rounded focus:ring-yellow-500 text-yellow-500 ml-1 w-5 h-5 ease-linear transition-all duration-150"
											/>
											<span class="ml-2 text-sm font-semibold text-blueGray-300">
												I agree with the
												<a href="/privacy" class="text-red-400"> Privacy Policy </a>
											</span>
										</label>
									</div>

									<div class="text-center mt-6">
										<button
											class="w-full px-4 py-2 tracking-wide text-white transition-colors duration-200 transform bg-pink-800 rounded-md hover:bg-pink-700 focus:outline-none focus:bg-pink-700"
											type="submit"
										>
											Create Account
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>
