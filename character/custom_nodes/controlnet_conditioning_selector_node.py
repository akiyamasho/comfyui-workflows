class ConditioningSelector:
    def __init__(self):
        pass

    @classmethod
    def INPUT_TYPES(cls):
        return {
            "required": {
                "canny_conditioning": ("CONDITIONING",),
                "pose_conditioning": ("CONDITIONING",),
                "select_mode": (["canny", "pose"],),
            }
        }

    RETURN_TYPES = ("CONDITIONING",)
    FUNCTION = "select_conditioning"
    CATEGORY = "conditioning"

    def select_conditioning(self, canny_conditioning, pose_conditioning, select_mode):
        if select_mode == "canny":
            return (canny_conditioning,)
        else:
            return (pose_conditioning,)


NODE_CLASS_MAPPINGS = {"Conditioning Selector": ConditioningSelector}
