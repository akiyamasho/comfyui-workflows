class CharacterSelector:
    CHARACTER_PRESETS = {
        "Mikaela": {
            "base_prompt": "1girl, hyouka, brown_hair, medium-length hair",
            "torso_up": "(off-shoulder top:1.5), (white clothes:1.5),",
            "waist_up": "black_short_skirt,",
            "legs_up": "bare_legs,",
            "full_body": "(heels:1.5),",
            "seed": 726243278021168,
        },
        # Add more character prompts and "perfect seed" here
    }
    CAMERA_VIEW = ["head", "torso_up", "waist_up", "legs_up", "full_body"]

    @classmethod
    def INPUT_TYPES(s):
        return {
            "required": {
                "character": (list(s.CHARACTER_PRESETS.keys()),),
                "camera_view": (list(s.CAMERA_VIEW),),
            }
        }

    RETURN_TYPES = ("STRING", "INT")
    RETURN_NAMES = ("prompt", "seed")
    FUNCTION = "process"
    CATEGORY = "utils"

    def process(self, character, camera_view):
        character = self.CHARACTER_PRESETS[character]
        prompt = character["base_prompt"]
        seed = character["seed"]

        if camera_view == "torso_up":
            prompt += character["torso_up"]
        elif camera_view == "waist_up":
            prompt += character["torso_up"]
            prompt += character["waist_up"]
        elif camera_view == "legs_up":
            prompt += character["torso_up"]
            prompt += character["waist_up"]
            prompt += character["legs_up"]
        elif camera_view == "full_body":
            prompt += character["torso_up"]
            prompt += character["waist_up"]
            prompt += character["legs_up"]
            prompt += character["full_body"]

        return (prompt, seed)


NODE_CLASS_MAPPINGS = {"Character Prompt Selector": CharacterSelector}
