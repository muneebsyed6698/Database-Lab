use inventory
db.furniture.insertMany([
  { name: "Table", color: "Brown", dimensions: [40, 80] },
  { name: "Chair", color: "Black", dimensions: [12, 18] },
  { name: "Sofa", color: "Grey", dimensions: [60, 120] }
])
db.furniture.insertOne({
  name: "Desk",
  color: "Brown",
  dimensions: [50, 100]
})
db.furniture.find({ "dimensions.0": { $gt: 30 } })
db.furniture.find({
  color: "Brown",
  name: { $in: ["Table", "Chair"] }
})
db.furniture.updateOne(
  { name: "Table" },
  { $set: { color: "Ivory" } }
)
db.furniture.updateMany(
  { color: "Brown" },
  { $set: { color: "Dark Brown" } }
)
db.furniture.deleteOne({ name: "Chair" })
db.furniture.deleteMany({ dimensions: [12, 18] })
db.furniture.aggregate([
  {
    $group: {
      _id: "$color",
      total_items: { $sum: 1 }
    }
  }
])
db.furniture.createIndex({ name: "text" })
db.furniture.find({ $text: { $search: "table" } })
