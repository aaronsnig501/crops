<script lang="ts">
	import { page } from "$app/stores";
  import PageStructure from "$lib/client/components/page/PageStructure.svelte";
	import { TabGroup, TabAnchor } from "@skeletonlabs/skeleton";
	import CategoryTree from "../tree/CategoryTree.svelte";

  export let categories: any
</script>

<PageStructure>
  <div slot="aside">
		<CategoryTree categories={categories} />
	</div>
	<div slot="content">
		<TabGroup justify="justify-center">
			<TabAnchor href="/" selected={$page.url.pathname === "/"}>
				Description
			</TabAnchor>
			<TabAnchor href="/growing" selected={$page.url.pathname === "/growing"}>
				Growing
			</TabAnchor>
			<TabAnchor>
				Cooking
			</TabAnchor>
			<TabAnchor>
				Perserving
			</TabAnchor>
			<svelte:fragment slot="panel">
				Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt maiores vero neque in nisi debitis ratione illo officiis itaque, voluptatum voluptatibus aperiam error ut animi quas excepturi laudantium quasi aliquam.
			</svelte:fragment>
		</TabGroup>
	</div>
</PageStructure>