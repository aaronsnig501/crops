<script lang="ts">
	import { TreeView, TreeViewItem } from "@skeletonlabs/skeleton"
	import type { PageData } from "./$types"

	export let data: PageData
	console.dir(data.categories)

	$: ({ categories } = data)
</script>

<main class="col-span-6">
	<div class="bg-gradient-to-r from-green-400 via-green-300 to-green-200 w-screen">
		<header class="py-56">
			<h1 class="text-center text-5xl block">Crops
				<small class="text-center text-xl block pt-4">by Smart Garden</small>
			</h1>
		</header>
	</div>
</main>

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
