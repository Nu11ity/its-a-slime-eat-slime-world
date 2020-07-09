using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SlimeFaceTestScript : MonoBehaviour
{
    public TextureSheetAnimator faceAnimator;
    public TextureSheetAnimation blinkAnim;

    private void Update()
    {
        if (TempInputManager.instance.Space_Key)
            faceAnimator.animateTextureSheet(blinkAnim);
    }
}
