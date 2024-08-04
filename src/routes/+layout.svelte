<script lang="ts">
	import '../app.postcss';
	import { LightSwitch, AppBar } from '@skeletonlabs/skeleton';
</script>

<AppBar gridColumns="grid-cols-3" slotDefault="place-self-center" slotTrail="place-content-end">
	<svelte:fragment slot="lead">(icon)</svelte:fragment>
	Smart Garden - Crops
	<svelte:fragment slot="trail">
		<LightSwitch />
	</svelte:fragment>
</AppBar>

<div class="container grid grid-cols-6 w-screen">
	<slot />
</div>

