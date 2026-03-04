using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SignPlayer : MonoBehaviour
{
    public Animator animator;
    public float defaultSpeed = 1.0f;

    public void PlaySequence(List<string> animationNames, float speed = -1f)
    {
        StopAllCoroutines();
        StartCoroutine(PlaySequenceCoroutine(animationNames, speed < 0 ? defaultSpeed : speed));
    }

    private IEnumerator PlaySequenceCoroutine(List<string> animationNames, float speed)
    {
        animator.speed = speed;
        foreach (var clipName in animationNames)
        {
            animator.Play(clipName, 0, 0f);
            yield return new WaitForSeconds(1.2f); // MVP
        }
        animator.speed = 1.0f;
    }
}
