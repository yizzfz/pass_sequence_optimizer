; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* %sum) #0 {
entry:
  %cmp51 = icmp sgt i32 %nr, 0
  br i1 %cmp51, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %np, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %xtraiter70 = and i32 %np, 1
  %wide.trip.count74 = zext i32 %np to i64
  %wide.trip.count68.1 = zext i32 %np to i64
  %xtraiter83 = and i32 %np, 3
  %wide.trip.count78.3 = zext i32 %np to i64
  %wide.trip.count88 = zext i32 %nq to i64
  %xtraiter = and i32 %np, 3
  %wide.trip.count.3 = zext i32 %np to i64
  %wide.trip.count60 = zext i32 %nq to i64
  %wide.trip.count92 = zext i32 %nr to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv90 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next91, %for.inc42 ]
  %4 = icmp sgt i32 %nq, 0
  br i1 %4, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %5 = icmp sgt i32 %np, 0
  br i1 %5, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %6 = icmp sgt i32 %np, 0
  br i1 %6, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit53

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.inc36.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.inc36.us:                                     ; preds = %for.inc36.us.preheader, %for.inc36.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.3, %for.inc36.us ], [ %indvars.iv76.unr, %for.inc36.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv76
  %7 = bitcast double* %arrayidx29.us to i64*
  %8 = load i64, i64* %7, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv76
  %9 = bitcast double* %arrayidx35.us to i64*
  store i64 %8, i64* %9, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next77
  %10 = bitcast double* %arrayidx29.us.1 to i64*
  %11 = load i64, i64* %10, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv.next77
  %12 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %11, i64* %12, align 8
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next77.1
  %13 = bitcast double* %arrayidx29.us.2 to i64*
  %14 = load i64, i64* %13, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv.next77.1
  %15 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %14, i64* %15, align 8
  %indvars.iv.next77.2 = add nsw i64 %indvars.iv76, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next77.2
  %16 = bitcast double* %arrayidx29.us.3 to i64*
  %17 = load i64, i64* %16, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv.next77.2
  %18 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %17, i64* %18, align 8
  %indvars.iv.next77.3 = add nsw i64 %indvars.iv76, 4
  %exitcond79.3 = icmp eq i64 %indvars.iv.next77.3, %wide.trip.count78.3
  br i1 %exitcond79.3, label %for.inc39.us.loopexit, label %for.inc36.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit53: ; preds = %for.cond4.preheader.us
  %19 = bitcast double* %sum to i8*
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit53
  %20 = icmp sgt i32 %np, 0
  br i1 %20, label %for.inc36.lr.ph.us, label %for.inc39.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %21 = icmp eq i32 %xtraiter70, 0
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv72
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %21, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %22 = ptrtoint double* %sum to i64
  %23 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv72
  %24 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %23, %24
  %sunkaddr94 = shl i64 %indvars.iv72, 3
  %sunkaddr95 = add i64 %22, %sunkaddr94
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  %25 = load double, double* %sunkaddr96, align 8
  %add.us.us.prol = fadd double %25, %mul.us.us.prol
  store double %add.us.us.prol, double* %sunkaddr96, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body6.us.us
  %indvars.iv66.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  %26 = icmp eq i32 %0, 0
  br i1 %26, label %for.cond7.for.inc22_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %for.inc.us.us ], [ %indvars.iv66.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv66
  %27 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv66, i64 %indvars.iv72
  %28 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %27, %28
  %sunkaddr = ptrtoint double* %sum to i64
  %sunkaddr104 = mul i64 %indvars.iv72, 8
  %sunkaddr105 = add i64 %sunkaddr, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to double*
  %29 = load double, double* %sunkaddr106, align 8
  %add.us.us = fadd double %29, %mul.us.us
  store double %add.us.us, double* %sunkaddr106, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv.next67
  %30 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next67, i64 %indvars.iv72
  %31 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %30, %31
  %32 = load double, double* %sunkaddr106, align 8
  %add.us.us.1 = fadd double %32, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr106, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond69.1 = icmp eq i64 %indvars.iv.next67.1, %wide.trip.count68.1
  br i1 %exitcond69.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.inc.us.us

for.inc36.lr.ph.us:                               ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %33 = icmp eq i32 %xtraiter83, 0
  br i1 %33, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.lr.ph.us
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol.preheader, %for.inc36.us.prol
  %indvars.iv76.prol = phi i64 [ %indvars.iv.next77.prol, %for.inc36.us.prol ], [ 0, %for.inc36.us.prol.preheader ]
  %prol.iter85 = phi i32 [ %prol.iter85.sub, %for.inc36.us.prol ], [ %xtraiter83, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv76.prol
  %34 = bitcast double* %arrayidx29.us.prol to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv86, i64 %indvars.iv76.prol
  %36 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1
  %prol.iter85.sub = add i32 %prol.iter85, -1
  %prol.iter85.cmp = icmp eq i32 %prol.iter85.sub, 0
  br i1 %prol.iter85.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol, !llvm.loop !1

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.prol.loopexit.loopexit, %for.inc36.lr.ph.us
  %indvars.iv76.unr = phi i64 [ 0, %for.inc36.lr.ph.us ], [ %indvars.iv.next77.prol, %for.inc36.us.prol.loopexit.loopexit ]
  %37 = icmp ult i32 %0, 3
  br i1 %37, label %for.inc39.us, label %for.inc36.us.preheader

for.inc36.us.preheader:                           ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  %38 = icmp sgt i32 %np, 0
  br i1 %38, label %for.inc36.lr.ph, label %for.inc39

for.inc36.lr.ph:                                  ; preds = %for.cond4.preheader
  %39 = icmp eq i32 %xtraiter, 0
  br i1 %39, label %for.inc36.prol.loopexit, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  br label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.prol.preheader, %for.inc36.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc36.prol ], [ 0, %for.inc36.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc36.prol ], [ %xtraiter, %for.inc36.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv.prol
  %40 = bitcast double* %arrayidx29.prol to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv58, i64 %indvars.iv.prol
  %42 = bitcast double* %arrayidx35.prol to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc36.prol.loopexit.loopexit, label %for.inc36.prol, !llvm.loop !3

for.inc36.prol.loopexit.loopexit:                 ; preds = %for.inc36.prol
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol.loopexit.loopexit, %for.inc36.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc36.lr.ph ], [ %indvars.iv.next.prol, %for.inc36.prol.loopexit.loopexit ]
  %43 = icmp ult i32 %0, 3
  br i1 %43, label %for.inc39, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc36 ], [ %indvars.iv.unr, %for.inc36.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv
  %44 = bitcast double* %arrayidx29 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv58, i64 %indvars.iv
  %46 = bitcast double* %arrayidx35 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next
  %47 = bitcast double* %arrayidx29.1 to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv58, i64 %indvars.iv.next
  %49 = bitcast double* %arrayidx35.1 to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.1
  %50 = bitcast double* %arrayidx29.2 to i64*
  %51 = load i64, i64* %50, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv58, i64 %indvars.iv.next.1
  %52 = bitcast double* %arrayidx35.2 to i64*
  store i64 %51, i64* %52, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.2
  %53 = bitcast double* %arrayidx29.3 to i64*
  %54 = load i64, i64* %53, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv90, i64 %indvars.iv58, i64 %indvars.iv.next.2
  %55 = bitcast double* %arrayidx35.3 to i64*
  store i64 %54, i64* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.inc36

for.inc39.loopexit:                               ; preds = %for.inc36
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.inc36.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond, label %for.inc42.loopexit107, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit107:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit107, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, %wide.trip.count92
  br i1 %exitcond93, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
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
  tail call void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) #0 {
for.cond1.preheader.us.preheader:
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next13, %for.cond1.for.inc15_crit_edge.us ]
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 150
  br i1 %exitcond14, label %for.cond22.preheader.us.preheader, label %for.cond4.preheader.us.us.preheader

for.cond22.preheader.us.preheader:                ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond22.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc12_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next9, %for.cond4.for.inc12_crit_edge.us.us ]
  %0 = mul nuw nsw i64 %indvars.iv8, %indvars.iv12
  br label %for.inc.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 140
  br i1 %exitcond11, label %for.cond1.for.inc15_crit_edge.us, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv4 = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next5.1, %for.inc.us.us ]
  %1 = add nuw nsw i64 %indvars.iv4, %0
  %2 = trunc i64 %1 to i32
  %rem.us.us = srem i32 %2, 160
  %conv.us.us = sitofp i32 %rem.us.us to double
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv12, i64 %indvars.iv8, i64 %indvars.iv4
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %3 = add nuw nsw i64 %indvars.iv.next5, %0
  %4 = trunc i64 %3 to i32
  %rem.us.us.1 = srem i32 %4, 160
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %div.us.us.v.i0.2 = insertelement <2 x double> %div.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %div.us.us = fdiv <2 x double> %div.us.us.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %5, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %exitcond7.1 = icmp eq i64 %indvars.iv.next5.1, 160
  br i1 %exitcond7.1, label %for.cond4.for.inc12_crit_edge.us.us, label %for.inc.us.us

for.cond22.preheader.us:                          ; preds = %for.cond22.preheader.us.preheader, %for.cond22.for.inc38_crit_edge.us
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.cond22.for.inc38_crit_edge.us ], [ 0, %for.cond22.preheader.us.preheader ]
  br label %for.inc35.us

for.inc35.us:                                     ; preds = %for.inc35.us, %for.cond22.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader.us ], [ %indvars.iv.next.1, %for.inc35.us ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %7 = trunc i64 %6 to i32
  %rem27.us = srem i32 %7, 160
  %conv28.us = sitofp i32 %rem27.us to double
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv2, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %rem27.us.1 = srem i32 %9, 160
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.v.i0.1 = insertelement <2 x double> undef, double %conv28.us, i32 0
  %div30.us.v.i0.2 = insertelement <2 x double> %div30.us.v.i0.1, double %conv28.us.1, i32 1
  %div30.us = fdiv <2 x double> %div30.us.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34.us to <2 x double>*
  store <2 x double> %div30.us, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us, label %for.inc35.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.inc35.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond, label %for.end40, label %for.cond22.preheader.us

for.end40:                                        ; preds = %for.cond22.for.inc38_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* nocapture readonly %A) #1 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc21_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv7, 140
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 150
  br i1 %exitcond10, label %for.end23, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next3, %for.cond5.for.inc18_crit_edge.us.us ]
  %4 = add nuw nsw i64 %indvars.iv2, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 140
  br i1 %exitcond6, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem.us.us = srem i32 %7, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body7.us.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv7, i64 %indvars.iv2, i64 %indvars.iv
  %10 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.cond2.for.inc21_crit_edge.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
