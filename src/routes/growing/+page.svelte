<script>
	import { page } from "$app/stores";


	import { TabAnchor, TabGroup, TreeView, TreeViewItem } from "@skeletonlabs/skeleton";

</script>


<TabGroup justify="justify-center" class="col-span-4 mt-12">
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
  Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quaerat, ipsum repellat, voluptas facilis sunt pariatur molestias excepturi, neque nisi minus sed beatae modi molestiae nihil at ut labore laudantium dolorum.
</TabGroup>