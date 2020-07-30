using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AbilityProjectile : MonoBehaviour
{
    public bool allowCasting;
    public float lifeTime;
    public float speed;
    public enum Path { Fire, Water, Nature}
    public Path path;
    public LayerMask desiredLayers;
    public int damage;
    public float damageRadius;
    public List<GameObject> disableOnImpact;

    private Slime MySlime { get; set; }
    private float currentLife;
    private bool begunFadeout;
    private Collider[] targets;

    public void Initialize(Slime _caller)
    {
        MySlime = _caller;
        AbilityManager.Instance.DelegateBasicAttackPool(this);
    }
    public void Update()
    {
        if (begunFadeout)
            return;//stops everything progressing

        currentLife += Time.deltaTime;
        if (currentLife > lifeTime)
            FadeOut();

        if (allowCasting && gameObject.activeSelf)
        {
            transform.position = transform.position + transform.forward * Time.deltaTime * speed;
            DamageCast();
        }      
    }
    private void FadeOut()
    {
        begunFadeout = true;
        allowCasting = false;
        for (int j = 0; j < disableOnImpact.Count; j++)
            disableOnImpact[j].SetActive(false);
        Invoke("ResetToPool", 1.2f);
    }
    private void ResetToPool()
    {
        gameObject.SetActive(false);
    }
    private void DamageCast()
    {
        targets = Physics.OverlapSphere(transform.position, damageRadius, desiredLayers);
        if(targets.Length > 0)
        {
            for (int i = 0; i < targets.Length; i++)
            {
                if(targets[i].gameObject != MySlime.gameObject)
                {
                    targets[i].GetComponent<Slime>().TakeDamage(damage);
                    OnImpact();
                    FadeOut();
                }           
            }
        }
    }
    private void OnImpact()
    {

    }
    private void OnEnable()
    {

    } 
    private void OnDisable()
    {
        currentLife = 0;
        begunFadeout = false;
        allowCasting = true;
        for (int j = 0; j < disableOnImpact.Count; j++)
            disableOnImpact[j].SetActive(true);
        //reset parent and position
        //reset to pool
    }
}
