<script>
	import '../app.postcss';
	import { page, navigating } from '$app/stores';
	import PreloadingIndicator from '$lib/PreloadingIndicator.svelte';
</script>

{#if $navigating}
	<PreloadingIndicator />
{/if}

<slot />
