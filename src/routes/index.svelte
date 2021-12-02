<script>
	import '../app.postcss';
	import Profiles from '$lib/profiles.svelte';
	import Testimonials from '$lib/testimonials.svelte';
	import Header from '$lib/header.svelte';
	import Footer from '$lib/footer.svelte';
	import ThreePanels from '$lib/three-panels.svelte';
	const heroImage = '/img/simple_date.png';
</script>

<svelte:head>
	<title>at8.online</title>
</svelte:head>

<Header />

<section class="text-gray-600 body-font bg-purple-50">
	<div class="container mx-auto flex px-5 py-16 md:flex-row flex-col items-center">
		<div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6 mb-10 md:mb-0">
			<img class="object-cover object-center rounded" alt="hero" src={heroImage} />
		</div>
		<div
			class="lg:flex-grow md:w-1/2 lg:pl-24 md:pl-16 flex flex-col md:items-start md:text-left items-center text-center"
		>
			<h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900">
				Join community of swipers ;) to start sparkling relations!
			</h1>
			<p class="mb-8 leading-relaxed">
				Our simple to use and privacy first application will assist you in making new connection in
				no time. Simply Sign up and start swiping through profiles immediatelly.
			</p>
			<div class="flex justify-center">
				<a
					href="/register"
					class="inline-flex text-white bg-pink-600 border-0 py-2 px-6 focus:outline-none hover:bg-pink-600 rounded text-lg"
					>Join</a
				>
				<a
					href="/login"
					class="ml-4 inline-flex text-gray-700 bg-warmGray-300 border-0 py-2 px-6 focus:outline-none hover:bg-pink-200 rounded text-lg"
					>Login</a
				>
			</div>
		</div>
	</div>
</section>

<Testimonials />

<Profiles />

<ThreePanels />

<Footer />
