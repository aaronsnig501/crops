<script lang="ts">
	import type { PageData } from "./$types"

	import { page } from "$app/stores";
	import PageStructure from "$lib/client/components/page/PageStructure.svelte";
	import { TabGroup, TabAnchor, TreeView, TreeViewItem } from "@skeletonlabs/skeleton";

	export let data: PageData

	$: ({ categories } = data)
</script>

<PageStructure>
  <div slot="aside">
		<TreeView>
			{#each categories as category}
				{#if category.crops.length >= 1}
					<TreeViewItem>
						{category.name}
						<svelte:fragment slot="children">
							{#each category.crops as crop}
								<TreeViewItem>
									{crop.name}
									<svelte:fragment slot="children">
										{#each crop.types as type}
											<TreeViewItem>
												{type.name}
											</TreeViewItem>
										{/each}
									</svelte:fragment>
								</TreeViewItem>
							{/each}
						</svelte:fragment>
					</TreeViewItem>
				{/if}
			{/each}
		</TreeView>
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
