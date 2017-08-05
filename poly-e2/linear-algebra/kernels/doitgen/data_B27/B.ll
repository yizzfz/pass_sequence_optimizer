; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %0 = bitcast double* %sum to i8*
  %1 = sext i32 %np to i64
  %2 = sext i32 %nq to i64
  %cmp23 = icmp sgt i32 %nr, 0
  br i1 %cmp23, label %for.cond1.preheader.lr.ph, label %entry.for.end44_crit_edge

entry.for.end44_crit_edge:                        ; preds = %entry
  br label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count = zext i32 %np to i64
  %3 = add nsw i64 %1, -1
  %4 = shl nsw i64 %1, 3
  %5 = icmp sgt i32 %nq, 0
  %6 = icmp sgt i32 %np, 0
  %7 = icmp eq i32 %np, 0
  %8 = icmp sgt i32 %np, 0
  %sunkaddr = ptrtoint double* %sum to i64
  %9 = icmp sgt i32 %np, 0
  %scevgep62 = getelementptr double, double* %sum, i64 %1
  %scevgep79 = getelementptr double, double* %sum, i64 %1
  %min.iters.check = icmp ult i32 %np, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  %min.iters.check69 = icmp ult i32 %np, 4
  %n.vec72 = and i64 %1, -4
  %cmp.zero73 = icmp eq i64 %n.vec72, 0
  %cmp.n90 = icmp eq i64 %1, %n.vec72
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %10 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.inc42.for.cond1.preheader_crit_edge ]
  br i1 %5, label %for.cond4.preheader.lr.ph, label %for.cond1.preheader.for.inc42_crit_edge

for.cond1.preheader.for.inc42_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %10 to i64
  br i1 %6, label %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge, label %for.cond4.preheader.preheader

for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge: ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %idxprom30 = sext i32 %10 to i64
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.inc39.us.for.cond4.preheader.us_crit_edge, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge
  %11 = phi i32 [ %split16.us, %for.inc39.us.for.cond4.preheader.us_crit_edge ], [ %10, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %for.inc39.us.for.cond4.preheader.us_crit_edge ], [ 0, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  %scevgep59 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 0, i64 %indvars.iv720.us, i64 %1
  br i1 %7, label %for.body6.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge, label %for.cond4.preheader.us.for.body6.us24_crit_edge

for.cond4.preheader.us.for.body6.us24_crit_edge:  ; preds = %for.cond4.preheader.us
  br label %for.body6.us24

for.inc39.us:                                     ; preds = %middle.block.for.inc39.us_crit_edge, %for.cond4.for.cond25.preheader_crit_edge.us.for.inc39.us_crit_edge, %for.body27.us.for.inc39.us_crit_edge
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next8.us, %2
  br i1 %cmp2.us, label %for.inc39.us.for.cond4.preheader.us_crit_edge, label %for.inc39.us.for.inc42_crit_edge

for.inc39.us.for.inc42_crit_edge:                 ; preds = %for.inc39.us
  br label %for.inc42

for.inc39.us.for.cond4.preheader.us_crit_edge:    ; preds = %for.inc39.us
  br label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us.for.body27.us_crit_edge
  %indvars.iv518.us = phi i64 [ %indvars.iv.next6.us, %for.body27.us.for.body27.us_crit_edge ], [ %indvars.iv518.us.ph, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv518.us
  %12 = bitcast double* %arrayidx29.us to i64*
  %13 = load i64, i64* %12, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %indvars.iv518.us
  %14 = bitcast double* %arrayidx35.us to i64*
  store i64 %13, i64* %14, align 8
  %exitcond49 = icmp eq i64 %indvars.iv518.us, %3
  br i1 %exitcond49, label %for.body27.us.for.inc39.us_crit_edge, label %for.body27.us.for.body27.us_crit_edge, !llvm.loop !1

for.body27.us.for.body27.us_crit_edge:            ; preds = %for.body27.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv518.us, 1
  br label %for.body27.us

for.body27.us.for.inc39.us_crit_edge:             ; preds = %for.body27.us
  br label %for.inc39.us

for.body6.us24:                                   ; preds = %for.cond7.for.inc22_crit_edge.us41.for.body6.us24_crit_edge, %for.cond4.preheader.us.for.body6.us24_crit_edge
  %indvars.iv314.us25 = phi i64 [ %indvars.iv.next4.us38, %for.cond7.for.inc22_crit_edge.us41.for.body6.us24_crit_edge ], [ 0, %for.cond4.preheader.us.for.body6.us24_crit_edge ]
  %arrayidx.us26 = getelementptr inbounds double, double* %sum, i64 %indvars.iv314.us25
  store double 0.000000e+00, double* %arrayidx.us26, align 8
  %sunkaddr52 = shl i64 %indvars.iv314.us25, 3
  %sunkaddr53 = add i64 %sunkaddr, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  br label %for.body9.us27

for.body9.us27:                                   ; preds = %for.body9.us27.for.body9.us27_crit_edge, %for.body6.us24
  %15 = phi double [ 0.000000e+00, %for.body6.us24 ], [ %add.us32, %for.body9.us27.for.body9.us27_crit_edge ]
  %indvars.iv12.us28 = phi i64 [ 0, %for.body6.us24 ], [ %indvars.iv.next.us33, %for.body9.us27.for.body9.us27_crit_edge ]
  %arrayidx15.us29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv720.us, i64 %indvars.iv12.us28
  %16 = load double, double* %arrayidx15.us29, align 8
  %arrayidx19.us30 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv12.us28, i64 %indvars.iv314.us25
  %17 = load double, double* %arrayidx19.us30, align 8
  %mul.us31 = fmul double %16, %17
  %add.us32 = fadd double %15, %mul.us31
  store double %add.us32, double* %sunkaddr54, align 8
  %indvars.iv.next.us33 = add nuw nsw i64 %indvars.iv12.us28, 1
  %exitcond.us34 = icmp eq i64 %indvars.iv.next.us33, %wide.trip.count
  br i1 %exitcond.us34, label %for.cond7.for.inc22_crit_edge.us41, label %for.body9.us27.for.body9.us27_crit_edge

for.body9.us27.for.body9.us27_crit_edge:          ; preds = %for.body9.us27
  br label %for.body9.us27

for.cond7.for.inc22_crit_edge.us41:               ; preds = %for.body9.us27
  %indvars.iv.next4.us38 = add nuw nsw i64 %indvars.iv314.us25, 1
  %cmp5.us39 = icmp slt i64 %indvars.iv.next4.us38, %1
  br i1 %cmp5.us39, label %for.cond7.for.inc22_crit_edge.us41.for.body6.us24_crit_edge, label %for.cond7.for.inc22_crit_edge.us41.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge

for.cond7.for.inc22_crit_edge.us41.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge: ; preds = %for.cond7.for.inc22_crit_edge.us41
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond7.for.inc22_crit_edge.us41.for.body6.us24_crit_edge: ; preds = %for.cond7.for.inc22_crit_edge.us41
  br label %for.body6.us24

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond7.for.inc22_crit_edge.us41.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge, %for.body6.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge
  %split16.us = phi i32 [ %11, %for.body6.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge ], [ %10, %for.cond7.for.inc22_crit_edge.us41.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge ]
  br i1 %8, label %for.body27.lr.ph.us, label %for.cond4.for.cond25.preheader_crit_edge.us.for.inc39.us_crit_edge

for.cond4.for.cond25.preheader_crit_edge.us.for.inc39.us_crit_edge: ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br label %for.inc39.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %idxprom30.us = sext i32 %split16.us to i64
  br i1 %min.iters.check, label %for.body27.lr.ph.us.for.body27.us_crit_edge, label %min.iters.checked

for.body27.lr.ph.us.for.body27.us_crit_edge:      ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.preheader

min.iters.checked:                                ; preds = %for.body27.lr.ph.us
  br i1 %cmp.zero, label %min.iters.checked.for.body27.us_crit_edge, label %vector.memcheck

min.iters.checked.for.body27.us_crit_edge:        ; preds = %min.iters.checked
  br label %for.body27.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %18 = sext i32 %split16.us to i64
  %19 = mul nsw i64 %18, 22400
  %scevgep57 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 0, i64 %indvars.iv720.us, i64 %19
  %scevgep60 = getelementptr double, double* %scevgep59, i64 %19
  %bound0 = icmp ult double* %scevgep57, %scevgep62
  %bound1 = icmp ugt double* %scevgep60, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.for.body27.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.for.body27.us_crit_edge:          ; preds = %vector.memcheck
  br label %for.body27.us.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %20 = getelementptr inbounds double, double* %sum, i64 %index
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %21, align 8, !alias.scope !4
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x i64>*
  %wide.load65 = load <2 x i64>, <2 x i64>* %23, align 8, !alias.scope !4
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv720.us, i64 %index
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %25, align 8, !alias.scope !7, !noalias !4
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  store <2 x i64> %wide.load65, <2 x i64>* %27, align 8, !alias.scope !7, !noalias !4
  %index.next = add i64 %index, 4
  %28 = icmp eq i64 %index.next, %n.vec
  br i1 %28, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.inc39.us_crit_edge, label %middle.block.for.body27.us_crit_edge

middle.block.for.body27.us_crit_edge:             ; preds = %middle.block
  br label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.lr.ph.us.for.body27.us_crit_edge, %min.iters.checked.for.body27.us_crit_edge, %vector.memcheck.for.body27.us_crit_edge, %middle.block.for.body27.us_crit_edge
  %indvars.iv518.us.ph = phi i64 [ 0, %vector.memcheck.for.body27.us_crit_edge ], [ 0, %min.iters.checked.for.body27.us_crit_edge ], [ 0, %for.body27.lr.ph.us.for.body27.us_crit_edge ], [ %n.vec, %middle.block.for.body27.us_crit_edge ]
  br label %for.body27.us

middle.block.for.inc39.us_crit_edge:              ; preds = %middle.block
  br label %for.inc39.us

for.body6.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %4, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.preheader:                              ; preds = %for.inc39.for.cond4.preheader_crit_edge, %for.cond4.preheader.preheader
  %indvars.iv720 = phi i64 [ %indvars.iv.next8, %for.inc39.for.cond4.preheader_crit_edge ], [ 0, %for.cond4.preheader.preheader ]
  %scevgep75 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv720, i64 0
  %scevgep77 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv720, i64 %1
  br i1 %9, label %for.body27.preheader, label %for.cond4.preheader.for.inc39_crit_edge

for.cond4.preheader.for.inc39_crit_edge:          ; preds = %for.cond4.preheader
  br label %for.inc39

for.body27.preheader:                             ; preds = %for.cond4.preheader
  br i1 %min.iters.check69, label %for.body27.preheader.for.body27_crit_edge, label %min.iters.checked70

for.body27.preheader.for.body27_crit_edge:        ; preds = %for.body27.preheader
  br label %for.body27.preheader97

min.iters.checked70:                              ; preds = %for.body27.preheader
  br i1 %cmp.zero73, label %min.iters.checked70.for.body27_crit_edge, label %vector.memcheck85

min.iters.checked70.for.body27_crit_edge:         ; preds = %min.iters.checked70
  br label %for.body27.preheader97

vector.memcheck85:                                ; preds = %min.iters.checked70
  %bound081 = icmp ult double* %scevgep75, %scevgep79
  %bound182 = icmp ugt double* %scevgep77, %sum
  %memcheck.conflict84 = and i1 %bound081, %bound182
  br i1 %memcheck.conflict84, label %vector.memcheck85.for.body27_crit_edge, label %vector.memcheck85.vector.body66_crit_edge

vector.memcheck85.vector.body66_crit_edge:        ; preds = %vector.memcheck85
  br label %vector.body66

vector.memcheck85.for.body27_crit_edge:           ; preds = %vector.memcheck85
  br label %for.body27.preheader97

vector.body66:                                    ; preds = %vector.body66.vector.body66_crit_edge, %vector.memcheck85.vector.body66_crit_edge
  %index87 = phi i64 [ %index.next88, %vector.body66.vector.body66_crit_edge ], [ 0, %vector.memcheck85.vector.body66_crit_edge ]
  %29 = getelementptr inbounds double, double* %sum, i64 %index87
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load95 = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !10
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x i64>*
  %wide.load96 = load <2 x i64>, <2 x i64>* %32, align 8, !alias.scope !10
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv720, i64 %index87
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load95, <2 x i64>* %34, align 8, !alias.scope !13, !noalias !10
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x i64>*
  store <2 x i64> %wide.load96, <2 x i64>* %36, align 8, !alias.scope !13, !noalias !10
  %index.next88 = add i64 %index87, 4
  %37 = icmp eq i64 %index.next88, %n.vec72
  br i1 %37, label %middle.block67, label %vector.body66.vector.body66_crit_edge, !llvm.loop !15

vector.body66.vector.body66_crit_edge:            ; preds = %vector.body66
  br label %vector.body66

middle.block67:                                   ; preds = %vector.body66
  br i1 %cmp.n90, label %middle.block67.for.inc39_crit_edge, label %middle.block67.for.body27_crit_edge

middle.block67.for.body27_crit_edge:              ; preds = %middle.block67
  br label %for.body27.preheader97

for.body27.preheader97:                           ; preds = %for.body27.preheader.for.body27_crit_edge, %min.iters.checked70.for.body27_crit_edge, %vector.memcheck85.for.body27_crit_edge, %middle.block67.for.body27_crit_edge
  %indvars.iv518.ph = phi i64 [ 0, %vector.memcheck85.for.body27_crit_edge ], [ 0, %min.iters.checked70.for.body27_crit_edge ], [ 0, %for.body27.preheader.for.body27_crit_edge ], [ %n.vec72, %middle.block67.for.body27_crit_edge ]
  br label %for.body27

middle.block67.for.inc39_crit_edge:               ; preds = %middle.block67
  br label %for.inc39

for.body27:                                       ; preds = %for.body27.preheader97, %for.body27.for.body27_crit_edge
  %indvars.iv518 = phi i64 [ %indvars.iv.next6, %for.body27.for.body27_crit_edge ], [ %indvars.iv518.ph, %for.body27.preheader97 ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv518
  %38 = bitcast double* %arrayidx29 to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv720, i64 %indvars.iv518
  %40 = bitcast double* %arrayidx35 to i64*
  store i64 %39, i64* %40, align 8
  %exitcond = icmp eq i64 %indvars.iv518, %3
  br i1 %exitcond, label %for.body27.for.inc39_crit_edge, label %for.body27.for.body27_crit_edge, !llvm.loop !16

for.body27.for.body27_crit_edge:                  ; preds = %for.body27
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv518, 1
  br label %for.body27

for.body27.for.inc39_crit_edge:                   ; preds = %for.body27
  br label %for.inc39

for.inc39:                                        ; preds = %for.body27.for.inc39_crit_edge, %middle.block67.for.inc39_crit_edge, %for.cond4.preheader.for.inc39_crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv720, 1
  %cmp2 = icmp slt i64 %indvars.iv.next8, %2
  br i1 %cmp2, label %for.inc39.for.cond4.preheader_crit_edge, label %for.inc39.for.inc42_crit_edge

for.inc39.for.inc42_crit_edge:                    ; preds = %for.inc39
  br label %for.inc42

for.inc39.for.cond4.preheader_crit_edge:          ; preds = %for.inc39
  br label %for.cond4.preheader

for.inc42:                                        ; preds = %for.inc39.for.inc42_crit_edge, %for.inc39.us.for.inc42_crit_edge, %for.cond1.preheader.for.inc42_crit_edge
  %.lcssa10 = phi i32 [ %10, %for.cond1.preheader.for.inc42_crit_edge ], [ %split16.us, %for.inc39.us.for.inc42_crit_edge ], [ %10, %for.inc39.for.inc42_crit_edge ]
  %inc43 = add nsw i32 %.lcssa10, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.inc42.for.cond1.preheader_crit_edge, label %for.inc42.for.end44_crit_edge

for.inc42.for.end44_crit_edge:                    ; preds = %for.inc42
  br label %for.end44

for.inc42.for.cond1.preheader_crit_edge:          ; preds = %for.inc42
  br label %for.cond1.preheader

for.end44:                                        ; preds = %for.inc42.for.end44_crit_edge, %entry.for.end44_crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #3
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15.for.cond1.preheader_crit_edge, %entry
  %indvars.iv1016 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc15.for.cond1.preheader_crit_edge ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvars.iv715 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.inc12.for.cond4.preheader_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv715, %indvars.iv1016
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.cond4.preheader
  %indvars.iv414 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next5, %for.body6.for.body6_crit_edge ]
  %1 = add nuw nsw i64 %indvars.iv414, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1016, i64 %indvars.iv715, i64 %indvars.iv414
  store double %div, double* %arrayidx11, align 8
  %exitcond17 = icmp eq i64 %indvars.iv414, 159
  br i1 %exitcond17, label %for.inc12, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv414, 1
  br label %for.body6

for.inc12:                                        ; preds = %for.body6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv715, 1
  %cmp2 = icmp slt i64 %indvars.iv.next8, 140
  br i1 %cmp2, label %for.inc12.for.cond4.preheader_crit_edge, label %for.inc15

for.inc12.for.cond4.preheader_crit_edge:          ; preds = %for.inc12
  br label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1016, 1
  %cmp = icmp slt i64 %indvars.iv.next11, 150
  br i1 %cmp, label %for.inc15.for.cond1.preheader_crit_edge, label %for.inc15.for.cond22.preheader_crit_edge

for.inc15.for.cond22.preheader_crit_edge:         ; preds = %for.inc15
  br label %for.cond22.preheader

for.inc15.for.cond1.preheader_crit_edge:          ; preds = %for.inc15
  br label %for.cond1.preheader

for.cond22.preheader:                             ; preds = %for.inc38.for.cond22.preheader_crit_edge, %for.inc15.for.cond22.preheader_crit_edge
  %indvars.iv213 = phi i64 [ %indvars.iv.next3, %for.inc38.for.cond22.preheader_crit_edge ], [ 0, %for.inc15.for.cond22.preheader_crit_edge ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25.for.body25_crit_edge, %for.cond22.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next, %for.body25.for.body25_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv12, %indvars.iv213
  %4 = trunc i64 %3 to i32
  %rem27 = srem i32 %4, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv213, i64 %indvars.iv12
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc38, label %for.body25.for.body25_crit_edge

for.body25.for.body25_crit_edge:                  ; preds = %for.body25
  br label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv213, 1
  %cmp19 = icmp slt i64 %indvars.iv.next3, 160
  br i1 %cmp19, label %for.inc38.for.cond22.preheader_crit_edge, label %for.end40

for.inc38.for.cond22.preheader_crit_edge:         ; preds = %for.inc38
  br label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21.for.cond2.preheader_crit_edge, %entry
  %indvars.iv510 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc21.for.cond2.preheader_crit_edge ]
  %3 = mul nsw i64 %indvars.iv510, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18.for.cond5.preheader_crit_edge, %for.cond2.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next4, %for.inc18.for.cond5.preheader_crit_edge ]
  %mul81 = add i64 %indvars.iv39, %3
  %add = mul i64 %mul81, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end.for.body7_crit_edge, %for.cond5.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end.for.body7_crit_edge ]
  %4 = add i64 %indvars.iv8, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.body7.if.end_crit_edge

for.body7.if.end_crit_edge:                       ; preds = %for.body7
  br label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body7.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv510, i64 %indvars.iv39, i64 %indvars.iv8
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %cmp6 = icmp slt i64 %indvars.iv.next, 160
  br i1 %cmp6, label %if.end.for.body7_crit_edge, label %for.inc18

if.end.for.body7_crit_edge:                       ; preds = %if.end
  br label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  %cmp3 = icmp slt i64 %indvars.iv.next4, 140
  br i1 %cmp3, label %for.inc18.for.cond5.preheader_crit_edge, label %for.inc21

for.inc18.for.cond5.preheader_crit_edge:          ; preds = %for.inc18
  br label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %cmp = icmp slt i64 %indvars.iv.next6, 150
  br i1 %cmp, label %for.inc21.for.cond2.preheader_crit_edge, label %for.end23

for.inc21.for.cond2.preheader_crit_edge:          ; preds = %for.inc21
  br label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !2, !3}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
