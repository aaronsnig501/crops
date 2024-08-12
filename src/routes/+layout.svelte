<script lang="ts">
	import '../app.postcss';
	import { LightSwitch, AppBar, TreeView } from '@skeletonlabs/skeleton';
</script>

<AppBar gridColumns="grid-cols-3" slotDefault="place-self-center" slotTrail="place-content-end">
	<svelte:fragment slot="lead"><a href="/">Smart Garden - Crops</a></svelte:fragment>
	<svelte:fragment slot="trail">
		<LightSwitch />
	</svelte:fragment>
</AppBar>

<main class="col-span-6">
	<div class="bg-gradient-to-r from-green-400 via-green-300 to-green-200 w-screen">
		<header class="py-56">
			<h1 class="text-center text-5xl block">Crops
				<small class="text-center text-xl block pt-4">by Smart Garden</small>
			</h1>
		</header>
	</div>
</main>

<div class="container grid grid-cols-6 w-screen">
	<slot />
</div>

