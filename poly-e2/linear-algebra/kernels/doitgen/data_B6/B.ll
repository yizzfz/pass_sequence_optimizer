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
  %cmp31 = icmp sgt i32 %nr, 0
  br i1 %cmp31, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %np, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %4 = zext i32 %np to i64
  %5 = add nsw i64 %4, -1
  %xtraiter90 = and i64 %4, 1
  %wide.trip.count73 = zext i32 %np to i64
  %wide.trip.count69.1 = zext i32 %np to i64
  %xtraiter92 = and i64 %4, 3
  %wide.trip.count77.3 = zext i32 %np to i64
  %wide.trip.count84 = zext i32 %nq to i64
  %xtraiter = and i64 %4, 3
  %wide.trip.count.3 = zext i32 %np to i64
  %wide.trip.count60 = zext i32 %nq to i64
  %wide.trip.count88 = zext i32 %nr to i64
  %6 = icmp sgt i32 %nq, 0
  %7 = icmp sgt i32 %np, 0
  %8 = icmp sgt i32 %np, 0
  %9 = icmp eq i64 %xtraiter90, 0
  %10 = icmp eq i64 %5, 0
  %sunkaddr = ptrtoint double* %sum to i64
  %11 = ptrtoint double* %sum to i64
  %12 = icmp sgt i32 %np, 0
  %13 = icmp eq i64 %xtraiter92, 0
  %14 = icmp ult i64 %5, 3
  %15 = bitcast double* %sum to i8*
  %16 = icmp sgt i32 %np, 0
  %17 = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %5, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv86 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next87, %for.inc42 ]
  br i1 %6, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %7, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %8, label %for.body6.us.us.preheader, label %for.cond25.preheader.us.loopexit53

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 0
  br label %for.body6.us.us

for.cond25.preheader.us.loopexit53:               ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond25.preheader.us

for.cond25.preheader.us.loopexit:                 ; preds = %for.inc22.us.us
  br label %for.cond25.preheader.us

for.cond25.preheader.us:                          ; preds = %for.cond25.preheader.us.loopexit, %for.cond25.preheader.us.loopexit53
  br i1 %12, label %for.inc36.lr.ph.us, label %for.inc39.us

for.inc36.lr.ph.us:                               ; preds = %for.cond25.preheader.us
  br i1 %13, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.lr.ph.us
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol.preheader, %for.inc36.us.prol
  %indvars.iv75.prol = phi i64 [ %indvars.iv.next76.prol, %for.inc36.us.prol ], [ 0, %for.inc36.us.prol.preheader ]
  %prol.iter94 = phi i64 [ %prol.iter94.sub, %for.inc36.us.prol ], [ %xtraiter92, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv75.prol
  %19 = bitcast double* %arrayidx29.us.prol to i64*
  %20 = load i64, i64* %19, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv75.prol
  %21 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %20, i64* %21, align 8
  %indvars.iv.next76.prol = add nuw nsw i64 %indvars.iv75.prol, 1
  %prol.iter94.sub = add nsw i64 %prol.iter94, -1
  %prol.iter94.cmp = icmp eq i64 %prol.iter94.sub, 0
  br i1 %prol.iter94.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol, !llvm.loop !1

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.prol.loopexit.loopexit, %for.inc36.lr.ph.us
  %indvars.iv75.unr = phi i64 [ 0, %for.inc36.lr.ph.us ], [ %xtraiter, %for.inc36.us.prol.loopexit.loopexit ]
  br i1 %14, label %for.inc39.us, label %for.inc36.us.preheader

for.inc36.us.preheader:                           ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us.preheader, %for.inc36.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76.3, %for.inc36.us ], [ %indvars.iv75.unr, %for.inc36.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv75
  %22 = bitcast double* %arrayidx29.us to i64*
  %23 = load i64, i64* %22, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv75
  %24 = bitcast double* %arrayidx35.us to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next76
  %25 = bitcast double* %arrayidx29.us.1 to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv.next76
  %27 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next76.1
  %28 = bitcast double* %arrayidx29.us.2 to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv.next76.1
  %30 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next76.2 = add nsw i64 %indvars.iv75, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next76.2
  %31 = bitcast double* %arrayidx29.us.3 to i64*
  %32 = load i64, i64* %31, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv.next76.2
  %33 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next76.3 = add nuw nsw i64 %indvars.iv75, 4
  %exitcond78.3 = icmp eq i64 %indvars.iv.next76.3, %wide.trip.count77.3
  br i1 %exitcond78.3, label %for.inc39.us.loopexit, label %for.inc36.us

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.inc36.us.prol.loopexit, %for.cond25.preheader.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.inc22.us.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.inc22.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv71
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %9, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %34 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv71
  %35 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %34, %35
  %sunkaddr95 = shl i64 %indvars.iv71, 3
  %sunkaddr96 = add i64 %11, %sunkaddr95
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to double*
  %36 = load double, double* %sunkaddr97, align 8
  %add.us.us.prol = fadd double %36, %mul.us.us.prol
  store double %add.us.us.prol, double* %sunkaddr97, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body6.us.us
  %indvars.iv67.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %10, label %for.inc22.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr104 = shl nuw nsw i64 %indvars.iv71, 3
  %sunkaddr105 = add i64 %sunkaddr, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to double*
  br label %for.inc.us.us

for.inc22.us.us.loopexit:                         ; preds = %for.inc.us.us
  br label %for.inc22.us.us

for.inc22.us.us:                                  ; preds = %for.inc22.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, %wide.trip.count73
  br i1 %exitcond74, label %for.cond25.preheader.us.loopexit, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %for.inc.us.us ], [ %indvars.iv67.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv67
  %37 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv67, i64 %indvars.iv71
  %38 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %37, %38
  %39 = load double, double* %sunkaddr106, align 8
  %add.us.us = fadd double %39, %mul.us.us
  store double %add.us.us, double* %sunkaddr106, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv82, i64 %indvars.iv.next68
  %40 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next68, i64 %indvars.iv71
  %41 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %40, %41
  %42 = load double, double* %sunkaddr106, align 8
  %add.us.us.1 = fadd double %42, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr106, align 8
  %indvars.iv.next68.1 = add nuw nsw i64 %indvars.iv67, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next68.1, %wide.trip.count69.1
  br i1 %exitcond70.1, label %for.inc22.us.us.loopexit, label %for.inc.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %16, label %for.inc36.lr.ph, label %for.inc39

for.inc36.lr.ph:                                  ; preds = %for.cond4.preheader
  br i1 %17, label %for.inc36.prol.loopexit, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  br label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.prol.preheader, %for.inc36.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc36.prol ], [ 0, %for.inc36.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc36.prol ], [ %xtraiter, %for.inc36.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv.prol
  %43 = bitcast double* %arrayidx29.prol to i64*
  %44 = load i64, i64* %43, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv58, i64 %indvars.iv.prol
  %45 = bitcast double* %arrayidx35.prol to i64*
  store i64 %44, i64* %45, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc36.prol.loopexit.loopexit, label %for.inc36.prol, !llvm.loop !3

for.inc36.prol.loopexit.loopexit:                 ; preds = %for.inc36.prol
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol.loopexit.loopexit, %for.inc36.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc36.lr.ph ], [ %xtraiter, %for.inc36.prol.loopexit.loopexit ]
  br i1 %18, label %for.inc39, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc36 ], [ %indvars.iv.unr, %for.inc36.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv
  %46 = bitcast double* %arrayidx29 to i64*
  %47 = load i64, i64* %46, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv58, i64 %indvars.iv
  %48 = bitcast double* %arrayidx35 to i64*
  store i64 %47, i64* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next
  %49 = bitcast double* %arrayidx29.1 to i64*
  %50 = load i64, i64* %49, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv58, i64 %indvars.iv.next
  %51 = bitcast double* %arrayidx35.1 to i64*
  store i64 %50, i64* %51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.1
  %52 = bitcast double* %arrayidx29.2 to i64*
  %53 = load i64, i64* %52, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv58, i64 %indvars.iv.next.1
  %54 = bitcast double* %arrayidx35.2 to i64*
  store i64 %53, i64* %54, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.2
  %55 = bitcast double* %arrayidx29.3 to i64*
  %56 = load i64, i64* %55, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv86, i64 %indvars.iv58, i64 %indvars.iv.next.2
  %57 = bitcast double* %arrayidx35.3 to i64*
  store i64 %56, i64* %57, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.inc36

for.inc39.loopexit:                               ; preds = %for.inc36
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.inc36.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %for.inc42.loopexit108, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit108:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit108, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv41 = phi i64 [ 0, %entry ], [ %indvars.iv.next42, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv37 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next38, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv37, %indvars.iv41
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv33 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next34.1, %for.inc ]
  %1 = add nuw nsw i64 %indvars.iv33, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv33
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %3 = add nuw nsw i64 %indvars.iv.next34, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next34.1, 160
  br i1 %exitcond36.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 140
  br i1 %exitcond40, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 150
  br i1 %exitcond43, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv30
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv30, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv30
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 160
  br i1 %exitcond32, label %for.end40, label %for.cond22.preheader

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

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv23 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv23, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next19, %for.inc18 ]
  %4 = add nuw nsw i64 %indvars.iv18, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv23, i64 %indvars.iv18, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 140
  br i1 %exitcond22, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 150
  br i1 %exitcond26, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
