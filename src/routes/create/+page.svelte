<script lang="ts">
	import { enhance } from "$app/forms"
	import PageStructure from "$lib/client/components/page/PageStructure.svelte"
  import { MarkdownEditor, Carta, Markdown } from "carta-md"
	import "carta-md/default.css"
	import DOMPurify from "isomorphic-dompurify"

  const carta = new Carta(
    {
      sanitizer: DOMPurify.sanitize,
    }
  )

  const postData = {
    level: "",
    name: "",
    description: "",
    growing: "",
    storing: "",
    preserving: "",
    cooking: ""
  }

  const handleCreateFormSubmission = async() => {
    await fetch(
      "/create", { 
        method: "POST", 
        body: JSON.stringify({ postData }), 
        headers: { "Content-Type": "application/json"}
      }
    )
  }
</script>

<PageStructure>
  <div slot="content">
    <form on:submit|preventDefault={handleCreateFormSubmission}>
      Level:
      <select bind:value={postData.level}>
        <option value="category" selected>Category</option>
        <option value="crop">Crop</option>
        <option value="type">Type</option>
      </select>

      Name:
      <input bind:value={postData.name} name="name" id="name" />
      Description:
      <MarkdownEditor {carta} bind:value={postData.description} />

      Growing:
      <MarkdownEditor {carta} bind:value={postData.growing} />

      Storing:
      <MarkdownEditor {carta} bind:value={postData.storing} />

      Cooking:
      <MarkdownEditor {carta} bind:value={postData.cooking} />

      Preserving:
      <MarkdownEditor {carta} bind:value={postData.preserving} />

      <button>Submit</button>
    </form>
  </div>
</PageStructure>
