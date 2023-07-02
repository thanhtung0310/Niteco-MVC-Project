namespace niteco_mvc_project.Controllers;

public class ordersController : BaseController
{
    private niteco_test_dbEntities db = new niteco_test_dbEntities();

    // GET: orders
    public async Task<ActionResult> Index()
    {
        var orders = db.orders.Include(o => o.customer).Include(o => o.product);
        return View(await orders.ToListAsync());
    }

    // GET: orders/Details/5
    public async Task<ActionResult> Details(Guid? id)
    {
        if (id == null)
        {
            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        }
        order order = await db.orders.FindAsync(id);
        if (order == null)
        {
            return HttpNotFound();
        }
        return View(order);
    }

    // GET: orders/Create
    public ActionResult Create()
    {
        ViewBag.customer_id = new SelectList(db.customers, "id", "name");
        ViewBag.product_id = new SelectList(db.products, "id", "name");
        return View();
    }

    // POST: orders/Create
    // To protect from overposting attacks, enable the specific properties you want to bind to, for
    // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> Create([Bind(Include = "id,customer_id,product_id,amount,order_date,name")] order order)
    {
        if (ModelState.IsValid)
        {
            order.id = Guid.NewGuid();
            order.created = order.modified = DateTime.UtcNow;
            db.orders.Add(order);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        ViewBag.customer_id = new SelectList(db.customers, "id", "name", order.customer_id);
        ViewBag.product_id = new SelectList(db.products, "id", "name", order.product_id);
        return View(order);
    }

    // GET: orders/Edit/5
    public async Task<ActionResult> Edit(Guid? id)
    {
        if (id == null)
        {
            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        }
        order order = await db.orders.FindAsync(id);
        if (order == null)
        {
            return HttpNotFound();
        }
        ViewBag.customer_id = new SelectList(db.customers, "id", "name", order.customer_id);
        ViewBag.product_id = new SelectList(db.products, "id", "name", order.product_id);
        return View(order);
    }

    // POST: orders/Edit/5
    // To protect from overposting attacks, enable the specific properties you want to bind to, for
    // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> Edit([Bind(Include = "id,customer_id,product_id,amount,order_date,name")] order order)
    {
        if (ModelState.IsValid)
        {
            order.modified = DateTime.UtcNow;
            db.Entry(order).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        ViewBag.customer_id = new SelectList(db.customers, "id", "name", order.customer_id);
        ViewBag.product_id = new SelectList(db.products, "id", "name", order.product_id);
        return View(order);
    }

    // GET: orders/Delete/5
    public async Task<ActionResult> Delete(Guid? id)
    {
        if (id == null)
        {
            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        }
        order order = await db.orders.FindAsync(id);
        if (order == null)
        {
            return HttpNotFound();
        }
        return View(order);
    }

    // POST: orders/Delete/5
    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> DeleteConfirmed(Guid id)
    {
        order order = await db.orders.FindAsync(id);
        db.orders.Remove(order);
        await db.SaveChangesAsync();
        return RedirectToAction("Index");
    }

    protected override void Dispose(bool disposing)
    {
        if (disposing)
        {
            db.Dispose();
        }
        base.Dispose(disposing);
    }
}