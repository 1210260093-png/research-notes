
>[!Lemma] 
>对任意 $\varepsilon,d_0>0$，存在 $\xi>0$，使得若二部图 $G$ 的两侧为 $X,Y$，密度 $d\ge d_0$，并且满足 
>$$\sum_{x\in X}\sum_{x'\in X}|N_G(x)\cap N_G(x')|^2
\le d^4|X|^2|Y|^2+\xi |X|^2|Y|^2,$$ 
>那么 $(X,Y)$ 是 $\varepsilon$-regular 的。

这个Lemma 是一个二部图版本的 quasirandomness 判据：如果二部图 $(X,Y)$ 的边密度 $d$ 不太小，并且 $X$ 侧任意两点的共同邻居数量整体上没有异常偏大，那么 $(X,Y)$ 就是 $\varepsilon$-regular 的。文章明确说它来自 Thomason 和 Chung--Graham--Wilson 的准随机图结果。

这里的核心量是 $|N_G(x)\cap N_G(x')|$，也就是 $x,x'\in X$ 的共同邻居数。若图真的像密度为 $d$ 的随机二部图，那么两个点的共同邻居大约是 $d^2|Y|$，平方后大约是 $d^4|Y|^2$，再对 $|X|^2$ 对点求和，就得到主项 $d^4|X|^2|Y|^2$。所以 Lemma 的意思是：只要共同邻居平方和没有比随机模型大太多，就不可能存在一大块 $X'\subseteq X$、$Y'\subseteq Y$ 的密度明显偏离整体密度。换句话说，codegree 的整体二阶控制推出 regularity。
