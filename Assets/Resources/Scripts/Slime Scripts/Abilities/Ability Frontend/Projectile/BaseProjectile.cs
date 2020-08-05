using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseProjectile : MonoBehaviour
{
    public PooledImpactObject impactObject;
    public bool allowCasting;
    public float lifeTime;
    public float speed;
    public enum Path { Fire, Water, Nature}
    public Path path;
    public LayerMask desiredLayers;
    public int slimeLayer;
    public int damage;
    public float radius;
    public List<GameObject> disableOnImpact;

    protected Slime MySlime { get; set; }
    protected float currentLife;
    protected bool begunFadeout;
    protected Collider[] targets;
    public Transform MyParent { get; set; }

    //Add a update MySlime method to counter bug where MySlime only set at spawn
    public virtual void DefineCaller(Slime _caller)
    {
        MySlime = _caller;
    }
    public virtual void Initialize(Slime _caller)
    {
        DefineCaller(_caller);
        AbilityManager.Instance.RegisterItemToPool(this);
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
    protected virtual void FadeOut()
    {
        begunFadeout = true;
        allowCasting = false;
        for (int j = 0; j < disableOnImpact.Count; j++)
            disableOnImpact[j].SetActive(false);
        Invoke("ResetToPool", 1.2f);
    }
    protected virtual void ResetToPool()
    {
        transform.parent = MyParent;
        gameObject.SetActive(false);
    }
    public virtual void DamageCast()
    {
        targets = Physics.OverlapSphere(transform.position, radius, desiredLayers);
        if (targets.Length > 0)
        {
            for (int i = 0; i < targets.Length; i++)
            {
                if (targets[i].gameObject != MySlime.gameObject)
                {
                    if (targets[i].gameObject.layer == slimeLayer)
                        targets[i].GetComponent<Slime>().TakeDamage(damage);

                    OnImpact();
                    FadeOut();
                }
            }
        }
    }
    public virtual void OnImpact()
    {
        impactObject.transform.parent = null;
        impactObject.gameObject.SetActive(true);
    }
    protected virtual void OnDisable()
    {
        currentLife = 0;
        begunFadeout = false;
        allowCasting = true;
        for (int j = 0; j < disableOnImpact.Count; j++)
            disableOnImpact[j].SetActive(true);
    }
}
