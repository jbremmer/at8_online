<script>
	import '../app.postcss';
	import SkcoLogo from '$lib/logo.svelte';
	const fieldBackground = '/img/field.jpg';
</script>

<svelte:head>
	<title>Register</title>
</svelte:head>

<div>
	<main>
		<section class="relative w-full h-full py-40 min-h-screen flex items-center justify-center">
			<div
				class="absolute top-0 w-full h-full bg-blueGray-800 bg-no-repeat bg-cover bg-center bg-blend-soft-light"
				style="background-image: url({fieldBackground});"
			/>

			<div class="container mx-auto px-4 h-full">
				<div class="flex content-center items-center justify-center h-full">
					<div class="w-full lg:w-4/12 px-4">
						<div
							class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded-lg bg-blueGray-200 bg-opacity-0 border-0"
						>
							<div class="rounded-t mb-0 px-6 py-6 pb-20">
								<div class="text-center mb-3">
									<SkcoLogo />
								</div>
							</div>
							<div class="flex-auto px-4 lg:px-10 py-10 pt-0">
								<div class="text-blueGray-300 text-center mb-3 font-bold">
									<small>Recover password</small>
								</div>
								<div class="text-blueGray-400 text-center mb-3 ">
									<small
										>We're sorry to hear about your password. Please enter your email below and we
										will send there recovery link.</small
									>
								</div>
								<form>
									<div class="relative w-full mb-3">
										<label
											class="block uppercase text-blueGray-200 text-xs font-bold mb-2"
											for="grid-email"
										>
											Email
										</label>
										<input
											id="grid-email"
											type="email"
											class="border-0 px-3 py-3 placeholder-blueGray-300 text-blueGray-100 bg-white rounded text-sm shadow focus:outline-none focus:ring focus:ring-yellow-500 w-full ease-linear transition-all duration-150"
											placeholder="Email"
										/>
									</div>

									<div class="text-center mt-6">
										<button
											class="bg-amber-500 text-white active:bg-blueGray-600 text-sm font-bold uppercase px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 w-full ease-linear transition-all duration-150"
											type="button"
										>
											Recover
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
