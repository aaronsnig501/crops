<script>
	import { TreeView, TreeViewItem } from "@skeletonlabs/skeleton";
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
	<TreeViewItem>
		Bulbs
		<svelte:fragment slot="children">
			<TreeViewItem>
				Onions
				<svelte:fragment slot="children">
					<TreeViewItem>
						Red
					</TreeViewItem>
					<TreeViewItem>
						Yellow
					</TreeViewItem>
				</svelte:fragment>
			</TreeViewItem>
			<TreeViewItem>
				Garlic
				<svelte:fragment slot="children">
					<TreeViewItem>
						Hardneck
					</TreeViewItem>
					<TreeViewItem>
						Softneck
					</TreeViewItem>
				</svelte:fragment>
			</TreeViewItem>
		</svelte:fragment>
	</TreeViewItem>
	<TreeViewItem>
		Tubers
		<svelte:fragment slot="children">
			<TreeViewItem>
				Potato
				<svelte:fragment slot="children">
					<TreeViewItem>
						First earlies
					</TreeViewItem>

					<TreeViewItem>
						Second earlies
					</TreeViewItem>

					<TreeViewItem>
						Main crop
					</TreeViewItem>
				</svelte:fragment>
			</TreeViewItem>
		</svelte:fragment>
	</TreeViewItem>
</TreeView>