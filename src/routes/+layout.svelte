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

<div class="container grid grid-cols-6 w-screen">
	<slot />
</div>

