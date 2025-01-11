# Character Rough or Pose to Consistent Latent-hi-res Character

This is a simple workflow that takes a rough character sketch or pose and generates a consistent character using an SDXL model of your choice.

1. Download the models used in this repo with the [`download_models.sh`](../download_models.sh) script.

2. (optional) Update the [`custom_nodes/character_selector_node.py`](custom_nodes/character_selector_node.py) file to include your own character prompts and "perfect seed". Ex.:

```python
class CharacterSelector:
    CHARACTER_PRESETS = {
        # ... other characters
        "Mikaela": {
            "base_prompt": "1girl, hyouka, brown_hair, medium-length hair",
            "torso_up": "(off-shoulder top:1.5), (white clothes:1.5),",
            "waist_up": "black_short_skirt,",
            "legs_up": "bare_legs,",
            "full_body": "(heels:1.5),",
            "seed": 726243278021168,
        },
        # ... other characters
    }
```
NOTE: The "perfect seed" is a seed that will generate the character consistently. This is useful for generating the same character with different poses. You can find the "perfect seed" by generating the character a few times with your model of choice (in our case, `animaginexl-3.1`) on another workflow or an SDXL runner online, and copying the seed from the "seed" field in the `character_selector_node.py` file.

3. Load the workflow. You can use the [`input_canny.jpg`](input_canny.jpg) or [`input_pose.jpg`](input_pose.jpg) images as input for the sample character Mikaela from [Venture Anime](https://venture-anime.com/about).

4. After loading the workflow, you may need to re-select the models if you get an error. Simply click on the "Select" button and choose the models from the `models` folder that were downloaded in the first step.

5. You should now be able to generate character(s) consistently using poses.