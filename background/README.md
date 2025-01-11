# BG Photo or Lineart

# ❌ WARNING: This workflow does not seem to be working as expected with latest versions of `torch`. Try using `torch` v2.1.0 or lower.

This is a simple workflow that takes a background photo or lineart and generates a background using an SDXL model of your choice.

1. Download the models used in this repo with the [`download_models.sh`](../download_models.sh) script.

2. Load the workflow. You can use the following files as input:
   - [`room_ref1.jpg`](room_ref1.jpg) and [`room_ref2.jpg`](room_ref2.jpg) for background photos.
   - [`room_input.jpg`](input_lineart.jpg) for a background lineart.

3. After loading the workflow, you may need to re-select the models if you get an error. Simply click on the "Select" button and choose the models from the `models` folder that were downloaded in the first step.
    - In addition, you may need to click on `Fit View` if nothing is showing up in the viewer.

4. Update the positive and negative prompts to fit the reference images you inputted.

5. You should now be able to generate the backgrounds with the input styles.