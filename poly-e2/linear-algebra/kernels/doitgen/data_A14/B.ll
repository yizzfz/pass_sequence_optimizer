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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %0 = sext i32 %np to i64
  %1 = sext i32 %nq to i64
  %cmp51 = icmp sgt i32 %nr, 0
  br i1 %cmp51, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count = zext i32 %np to i64
  %2 = shl nsw i64 %0, 3
  %3 = add nsw i64 %0, -1
  %4 = icmp sgt i32 %nq, 0
  %5 = icmp sgt i32 %np, 0
  %6 = icmp eq i32 %np, 0
  %7 = bitcast double* %sum to i8*
  %8 = icmp sgt i32 %np, 0
  %xtraiter67 = and i64 %0, 3
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %9 = icmp ult i64 %3, 3
  %xtraiter65 = and i64 %wide.trip.count, 1
  %lcmp.mod66 = icmp eq i64 %xtraiter65, 0
  %10 = icmp eq i32 %np, 1
  %sunkaddr73 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %11 = icmp sgt i32 %np, 0
  %xtraiter = and i64 %0, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %12 = icmp ult i64 %3, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc42
  %storemerge52 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.inc42 ]
  br i1 %4, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %storemerge52 to i64
  br i1 %5, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %idxprom30 = sext i32 %storemerge52 to i64
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %13 = phi i32 [ %split20.us, %for.inc39.us ], [ %storemerge52, %for.cond4.preheader.us.preheader ]
  %indvars.iv1124.us = phi i64 [ %indvars.iv.next12.us, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %6, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us29.preheader

for.body6.us29.preheader:                         ; preds = %for.cond4.preheader.us
  %arrayidx15.us34.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1124.us, i64 0
  br label %for.body6.us29

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1124.us, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next12.us, %1
  br i1 %exitcond64, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv922.us = phi i64 [ %indvars.iv.next10.us.3, %for.body27.us ], [ %indvars.iv922.us.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv922.us
  %14 = bitcast double* %arrayidx29.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1124.us, i64 %indvars.iv922.us
  %16 = bitcast double* %arrayidx35.us to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv922.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next10.us
  %17 = bitcast double* %arrayidx29.us.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1124.us, i64 %indvars.iv.next10.us
  %19 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next10.us.1 = add nsw i64 %indvars.iv922.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next10.us.1
  %20 = bitcast double* %arrayidx29.us.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1124.us, i64 %indvars.iv.next10.us.1
  %22 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next10.us.2 = add nsw i64 %indvars.iv922.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next10.us.2
  %23 = bitcast double* %arrayidx29.us.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1124.us, i64 %indvars.iv.next10.us.2
  %25 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next10.us.3 = add nsw i64 %indvars.iv922.us, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next10.us.3, %0
  br i1 %exitcond61.3, label %for.inc39.us.loopexit, label %for.body27.us

for.body6.us29:                                   ; preds = %for.body6.us29.preheader, %for.cond7.for.inc22_crit_edge.us46
  %indvars.iv718.us30 = phi i64 [ %indvars.iv.next8.us43, %for.cond7.for.inc22_crit_edge.us46 ], [ 0, %for.body6.us29.preheader ]
  %arrayidx.us31 = getelementptr inbounds double, double* %sum, i64 %indvars.iv718.us30
  store double 0.000000e+00, double* %arrayidx.us31, align 8
  br i1 %lcmp.mod66, label %for.body9.us32.prol.loopexit, label %for.body9.us32.prol

for.body9.us32.prol:                              ; preds = %for.body6.us29
  %26 = load double, double* %arrayidx15.us34.prol, align 8
  %arrayidx19.us35.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv718.us30
  %27 = load double, double* %arrayidx19.us35.prol, align 8
  %mul.us36.prol = fmul double %26, %27
  %add.us37.prol = fadd double %mul.us36.prol, 0.000000e+00
  %sunkaddr70 = shl i64 %indvars.iv718.us30, 3
  %sunkaddr71 = add i64 %sunkaddr, %sunkaddr70
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to double*
  store double %add.us37.prol, double* %sunkaddr72, align 8
  br label %for.body9.us32.prol.loopexit

for.body9.us32.prol.loopexit:                     ; preds = %for.body9.us32.prol, %for.body6.us29
  %.unr.ph = phi double [ %add.us37.prol, %for.body9.us32.prol ], [ 0.000000e+00, %for.body6.us29 ]
  %indvars.iv16.us33.unr.ph = phi i64 [ 1, %for.body9.us32.prol ], [ 0, %for.body6.us29 ]
  br i1 %10, label %for.cond7.for.inc22_crit_edge.us46, label %for.body9.us32.preheader

for.body9.us32.preheader:                         ; preds = %for.body9.us32.prol.loopexit
  %sunkaddr74 = shl i64 %indvars.iv718.us30, 3
  %sunkaddr75 = add i64 %sunkaddr73, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  br label %for.body9.us32

for.body9.us32:                                   ; preds = %for.body9.us32.preheader, %for.body9.us32
  %28 = phi double [ %add.us37.1, %for.body9.us32 ], [ %.unr.ph, %for.body9.us32.preheader ]
  %indvars.iv16.us33 = phi i64 [ %indvars.iv.next.us38.1, %for.body9.us32 ], [ %indvars.iv16.us33.unr.ph, %for.body9.us32.preheader ]
  %arrayidx15.us34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1124.us, i64 %indvars.iv16.us33
  %29 = load double, double* %arrayidx15.us34, align 8
  %arrayidx19.us35 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv16.us33, i64 %indvars.iv718.us30
  %30 = load double, double* %arrayidx19.us35, align 8
  %mul.us36 = fmul double %29, %30
  %add.us37 = fadd double %28, %mul.us36
  store double %add.us37, double* %sunkaddr76, align 8
  %indvars.iv.next.us38 = add nuw nsw i64 %indvars.iv16.us33, 1
  %arrayidx15.us34.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1124.us, i64 %indvars.iv.next.us38
  %31 = load double, double* %arrayidx15.us34.1, align 8
  %arrayidx19.us35.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us38, i64 %indvars.iv718.us30
  %32 = load double, double* %arrayidx19.us35.1, align 8
  %mul.us36.1 = fmul double %31, %32
  %add.us37.1 = fadd double %add.us37, %mul.us36.1
  store double %add.us37.1, double* %sunkaddr76, align 8
  %indvars.iv.next.us38.1 = add nsw i64 %indvars.iv16.us33, 2
  %exitcond.us39.1 = icmp eq i64 %indvars.iv.next.us38.1, %wide.trip.count
  br i1 %exitcond.us39.1, label %for.cond7.for.inc22_crit_edge.us46.loopexit, label %for.body9.us32

for.cond7.for.inc22_crit_edge.us46.loopexit:      ; preds = %for.body9.us32
  br label %for.cond7.for.inc22_crit_edge.us46

for.cond7.for.inc22_crit_edge.us46:               ; preds = %for.cond7.for.inc22_crit_edge.us46.loopexit, %for.body9.us32.prol.loopexit
  %indvars.iv.next8.us43 = add nuw nsw i64 %indvars.iv718.us30, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next8.us43, %0
  br i1 %exitcond57, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit81, label %for.body6.us29

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %2, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit81: ; preds = %for.cond7.for.inc22_crit_edge.us46
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit81, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit
  %split20.us = phi i32 [ %13, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ], [ %storemerge52, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit81 ]
  br i1 %8, label %for.body27.lr.ph.us, label %for.inc39.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %idxprom30.us = sext i32 %split20.us to i64
  br i1 %lcmp.mod68, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv922.us.prol = phi i64 [ %indvars.iv.next10.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter69 = phi i64 [ %prol.iter69.sub, %for.body27.us.prol ], [ %xtraiter67, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv922.us.prol
  %33 = bitcast double* %arrayidx29.us.prol to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1124.us, i64 %indvars.iv922.us.prol
  %35 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next10.us.prol = add nuw nsw i64 %indvars.iv922.us.prol, 1
  %prol.iter69.sub = add i64 %prol.iter69, -1
  %prol.iter69.cmp = icmp eq i64 %prol.iter69.sub, 0
  br i1 %prol.iter69.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv922.us.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next10.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %9, label %for.inc39.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv1124 = phi i64 [ %indvars.iv.next12, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %11, label %for.body27.lr.ph, label %for.inc39

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv922.prol = phi i64 [ %indvars.iv.next10.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv922.prol
  %36 = bitcast double* %arrayidx29.prol to i64*
  %37 = load i64, i64* %36, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1124, i64 %indvars.iv922.prol
  %38 = bitcast double* %arrayidx35.prol to i64*
  store i64 %37, i64* %38, align 8
  %indvars.iv.next10.prol = add nuw nsw i64 %indvars.iv922.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv922.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next10.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %12, label %for.inc39, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %indvars.iv922 = phi i64 [ %indvars.iv.next10.3, %for.body27 ], [ %indvars.iv922.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv922
  %39 = bitcast double* %arrayidx29 to i64*
  %40 = load i64, i64* %39, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1124, i64 %indvars.iv922
  %41 = bitcast double* %arrayidx35 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv922, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next10
  %42 = bitcast double* %arrayidx29.1 to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1124, i64 %indvars.iv.next10
  %44 = bitcast double* %arrayidx35.1 to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv922, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next10.1
  %45 = bitcast double* %arrayidx29.2 to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1124, i64 %indvars.iv.next10.1
  %47 = bitcast double* %arrayidx35.2 to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv922, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next10.2
  %48 = bitcast double* %arrayidx29.3 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1124, i64 %indvars.iv.next10.2
  %50 = bitcast double* %arrayidx35.3 to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv922, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next10.3, %0
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.body27

for.inc39.loopexit:                               ; preds = %for.body27
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.body27.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1124, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next12, %1
  br i1 %exitcond56, label %for.inc42.loopexit82, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit82:                             ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit82, %for.inc42.loopexit, %for.cond1.preheader
  %.lcssa14 = phi i32 [ %storemerge52, %for.cond1.preheader ], [ %split20.us, %for.inc42.loopexit ], [ %storemerge52, %for.inc42.loopexit82 ]
  %inc43 = add nsw i32 %.lcssa14, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv1420 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv1119 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next12, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv1119, %indvars.iv1420
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv818 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next9.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv818, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1420, i64 %indvars.iv1119, i64 %indvars.iv818
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next9 = or i64 %indvars.iv818, 1
  %3 = add nuw nsw i64 %indvars.iv.next9, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1420, i64 %indvars.iv1119, i64 %indvars.iv.next9
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv818, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next9.1, 160
  br i1 %exitcond22.1, label %for.inc12, label %for.body6

for.inc12:                                        ; preds = %for.body6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1119, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next12, 140
  br i1 %exitcond23, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1420, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next15, 150
  br i1 %exitcond24, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv617 = phi i64 [ %indvars.iv.next7, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv16, %indvars.iv617
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv617, i64 %indvars.iv16
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv16, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv617
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv617, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv617, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next7, 160
  br i1 %exitcond21, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv712 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv712, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv511 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next6, %for.inc18 ]
  %mul83 = add nuw nsw i64 %indvars.iv511, %3
  %add = mul nuw nsw i64 %mul83, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv10, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv712, i64 %indvars.iv511, i64 %indvars.iv10
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next6, 140
  br i1 %exitcond13, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next8, 150
  br i1 %exitcond14, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
