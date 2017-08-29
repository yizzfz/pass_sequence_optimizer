; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  %9 = sext i32 %1 to i64
  br i1 %7, label %.lr.ph8.split.us.preheader, label %._crit_edge9

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %10 = sext i32 %0 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next, %._crit_edge6.us ]
  br label %11

; <label>:11:                                     ; preds = %11, %.lr.ph8.split.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %11 ], [ 0, %.lr.ph8.split.us ]
  %12 = mul nsw i64 %indvars.iv27, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %8
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv27
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv27
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %9
  br i1 %exitcond, label %._crit_edge6.us, label %11

._crit_edge6.us:                                  ; preds = %11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next, %10
  br i1 %exitcond40, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.lr.ph8, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %.lr.ph2, label %._crit_edge3.loopexit

.lr.ph2:                                          ; preds = %._crit_edge9
  %22 = sext i32 %1 to i64
  %23 = shl nsw i64 %22, 3
  %24 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.lr.ph2
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol, %._crit_edge.us.prol.preheader
  %indvar.prol = phi i64 [ 0, %._crit_edge.us.prol.preheader ], [ %indvar.next.prol, %._crit_edge.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge.us.prol.preheader ], [ %prol.iter.sub, %._crit_edge.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.prol, i64 0
  %scevgep32.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.prol, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.unr-lcssa, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %.lr.ph2, %._crit_edge.us.prol.loopexit.unr-lcssa
  %indvar.unr = phi i64 [ 0, %.lr.ph2 ], [ %indvar.next.prol, %._crit_edge.us.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %24, 7
  br i1 %25, label %._crit_edge3.loopexit.loopexit, label %.lr.ph2.new

.lr.ph2.new:                                      ; preds = %._crit_edge.us.prol.loopexit
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.lr.ph2.new
  %indvar = phi i64 [ %indvar.unr, %.lr.ph2.new ], [ %indvar.next.7, %._crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar, i64 0
  %scevgep32 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next, i64 0
  %scevgep32.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.1, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.1, i64 0
  %scevgep32.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.2, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.2, i64 0
  %scevgep32.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.3, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.3 = add nsw i64 %indvar, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.3, i64 0
  %scevgep32.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.4, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.4 = add nsw i64 %indvar, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.4, i64 0
  %scevgep32.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.5, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.5 = add nsw i64 %indvar, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.5, i64 0
  %scevgep32.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.6, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.6 = add nsw i64 %indvar, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.6, i64 0
  %scevgep32.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep32.7, i8 0, i64 %23, i32 8, i1 false)
  %indvar.next.7 = add nsw i64 %indvar, 8
  %exitcond39.7 = icmp eq i64 %indvar.next.7, %22
  br i1 %exitcond39.7, label %._crit_edge3.loopexit.loopexit.unr-lcssa, label %._crit_edge.us

._crit_edge3.loopexit.loopexit.unr-lcssa:         ; preds = %._crit_edge.us
  br label %._crit_edge3.loopexit.loopexit

._crit_edge3.loopexit.loopexit:                   ; preds = %._crit_edge.us.prol.loopexit, %._crit_edge3.loopexit.loopexit.unr-lcssa
  br label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge3.loopexit.loopexit, %._crit_edge9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph14, label %._crit_edge15

.lr.ph14:                                         ; preds = %5
  %7 = sext i32 %0 to i64
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %7, -1
  %10 = icmp sgt i32 %0, 0
  %xtraiter = and i64 %7, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %11 = icmp ult i64 %9, 3
  %xtraiter92 = and i64 %7, 1
  %lcmp.mod93 = icmp eq i64 %xtraiter92, 0
  %12 = icmp eq i64 %9, 0
  %xtraiter98 = and i64 %7, 1
  %lcmp.mod99 = icmp eq i64 %xtraiter98, 0
  %13 = icmp eq i64 %9, 0
  br label %14

; <label>:14:                                     ; preds = %._crit_edge12, %.lr.ph14
  %indvar = phi i64 [ 0, %.lr.ph14 ], [ %sum, %._crit_edge12 ]
  %indvars.iv78 = phi i64 [ 1, %.lr.ph14 ], [ %indvars.iv.next79, %._crit_edge12 ]
  %15 = mul nuw nsw i64 %indvar, 1201
  %16 = add nuw nsw i64 %15, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %16
  %scevgep95 = bitcast double* %scevgep to i8*
  %17 = add nuw nsw i64 %indvar, 2
  %18 = icmp sgt i64 %17, %8
  %smax = select i1 %18, i64 %17, i64 %8
  %sum = add nuw nsw i64 %indvar, 1
  %19 = sub i64 %smax, %sum
  %20 = shl i64 %19, 3
  br i1 %10, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %14
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %21 = phi double [ %25, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvar
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %21, %24
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %xtraiter, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %25, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %25, %.prol.loopexit.loopexit ]
  br i1 %11, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %26 = phi double [ %42, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvar
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %28
  %30 = fadd double %26, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvar
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %32
  %34 = fadd double %30, %33
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvar
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %36
  %38 = fadd double %34, %37
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvar
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fadd double %38, %41
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %7
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %14
  %.lcssa1740 = phi double [ 0.000000e+00, %14 ], [ %.lcssa.unr, %.prol.loopexit ], [ %42, %._crit_edge.loopexit ]
  %43 = tail call double @sqrt(double %.lcssa1740) #4
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvar, i64 %indvar
  store double %43, double* %44, align 8
  br i1 %10, label %.lr.ph2, label %._crit_edge3

.lr.ph2:                                          ; preds = %._crit_edge
  br i1 %lcmp.mod93, label %.prol.loopexit91, label %.prol.preheader90

.prol.preheader90:                                ; preds = %.lr.ph2
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvar
  %46 = load double, double* %45, align 8
  %47 = fdiv double %46, %43
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvar
  store double %47, double* %48, align 8
  br label %.prol.loopexit91

.prol.loopexit91:                                 ; preds = %.prol.preheader90, %.lr.ph2
  %indvars.iv50.unr.ph = phi i64 [ 1, %.prol.preheader90 ], [ 0, %.lr.ph2 ]
  br i1 %12, label %._crit_edge3, label %.lr.ph2.new.preheader

.lr.ph2.new.preheader:                            ; preds = %.prol.loopexit91
  br label %.lr.ph2.new

.lr.ph2.new:                                      ; preds = %.lr.ph2.new.preheader, %.lr.ph2.new
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph2.new ], [ %indvars.iv50.unr.ph, %.lr.ph2.new.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv50, i64 %indvar
  %50 = load double, double* %49, align 8
  %51 = load double, double* %44, align 8
  %52 = fdiv double %50, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvar
  store double %52, double* %53, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next51, i64 %indvar
  %55 = load double, double* %54, align 8
  %56 = load double, double* %44, align 8
  %57 = fdiv double %55, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next51, i64 %indvar
  store double %57, double* %58, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next51.1, %7
  br i1 %exitcond.1, label %._crit_edge3.loopexit, label %.lr.ph2.new

._crit_edge3.loopexit:                            ; preds = %.lr.ph2.new
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.prol.loopexit91, %._crit_edge
  %59 = icmp slt i64 %sum, %8
  br i1 %59, label %.lr.ph11, label %._crit_edge12

.lr.ph11:                                         ; preds = %._crit_edge3
  br i1 %10, label %.lr.ph11.split.us.preheader, label %._crit_edge12.loopexit44

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvar
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvar
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us, %.lr.ph11.split.us.preheader
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge9.us ], [ %indvars.iv78, %.lr.ph11.split.us.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvar, i64 %indvars.iv80
  store double 0.000000e+00, double* %62, align 8
  br i1 %lcmp.mod99, label %.prol.loopexit97, label %.prol.preheader96

.prol.preheader96:                                ; preds = %.lr.ph11.split.us
  %63 = load double, double* %61, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv80
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %66, 0.000000e+00
  store double %67, double* %62, align 8
  br label %.prol.loopexit97

.prol.loopexit97:                                 ; preds = %.prol.preheader96, %.lr.ph11.split.us
  %68 = phi double [ %67, %.prol.preheader96 ], [ 0.000000e+00, %.lr.ph11.split.us ]
  %indvars.iv74.unr.ph = phi i64 [ 1, %.prol.preheader96 ], [ 0, %.lr.ph11.split.us ]
  br i1 %13, label %.lr.ph8.us, label %.lr.ph11.split.us.new.preheader

.lr.ph11.split.us.new.preheader:                  ; preds = %.prol.loopexit97
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.lr.ph11.split.us.new.preheader, %.lr.ph11.split.us.new
  %69 = phi double [ %81, %.lr.ph11.split.us.new ], [ %68, %.lr.ph11.split.us.new.preheader ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph11.split.us.new ], [ %indvars.iv74.unr.ph, %.lr.ph11.split.us.new.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %indvar
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv80
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %74, %69
  store double %75, double* %62, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next75, i64 %indvar
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next75, i64 %indvars.iv80
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %62, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  %exitcond.1101 = icmp eq i64 %indvars.iv.next75.1, %7
  br i1 %exitcond.1101, label %.lr.ph8.us.loopexit, label %.lr.ph11.split.us.new

.lr.ph8.us.loopexit:                              ; preds = %.lr.ph11.split.us.new
  br label %.lr.ph8.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us.loopexit, %.prol.loopexit97
  %82 = phi double [ %68, %.prol.loopexit97 ], [ %81, %.lr.ph8.us.loopexit ]
  br i1 %lcmp.mod99, label %.prol.loopexit103, label %.prol.preheader102

.prol.preheader102:                               ; preds = %.lr.ph8.us
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv80
  %84 = load double, double* %83, align 8
  %85 = load double, double* %60, align 8
  %86 = fmul double %85, %82
  %87 = fsub double %84, %86
  store double %87, double* %83, align 8
  br label %.prol.loopexit103

.prol.loopexit103:                                ; preds = %.prol.preheader102, %.lr.ph8.us
  %indvars.iv76.unr.ph = phi i64 [ 1, %.prol.preheader102 ], [ 0, %.lr.ph8.us ]
  br i1 %13, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit103
  br label %.lr.ph8.us.new

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.1, %.lr.ph8.us.new ], [ %indvars.iv76.unr.ph, %.lr.ph8.us.new.preheader ]
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv76, i64 %indvars.iv80
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv76, i64 %indvar
  %91 = load double, double* %90, align 8
  %92 = load double, double* %62, align 8
  %93 = fmul double %91, %92
  %94 = fsub double %89, %93
  store double %94, double* %88, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next77, i64 %indvars.iv80
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next77, i64 %indvar
  %98 = load double, double* %97, align 8
  %99 = load double, double* %62, align 8
  %100 = fmul double %98, %99
  %101 = fsub double %96, %100
  store double %101, double* %95, align 8
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  %exitcond.1107 = icmp eq i64 %indvars.iv.next77.1, %7
  br i1 %exitcond.1107, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit103
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond = icmp eq i64 %indvars.iv.next81, %8
  br i1 %exitcond, label %._crit_edge12.loopexit, label %.lr.ph11.split.us

._crit_edge12.loopexit44:                         ; preds = %.lr.ph11
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep95, i8 0, i64 %20, i32 8, i1 false)
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge12.loopexit44, %._crit_edge3
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond115 = icmp eq i64 %sum, %8
  br i1 %exitcond115, label %._crit_edge15.loopexit, label %14

._crit_edge15.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph10, label %._crit_edge11.loopexit

.lr.ph10:                                         ; preds = %4
  %10 = sext i32 %1 to i64
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge7.us, %.lr.ph10
  %indvars.iv6 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next7, %._crit_edge7.us ]
  %11 = mul nsw i64 %10, %indvars.iv6
  br label %12

; <label>:12:                                     ; preds = %19, %.lr.ph10.split.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %19 ], [ 0, %.lr.ph10.split.us ]
  %13 = add nsw i64 %11, %indvars.iv32
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc14.us = call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv32
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next33, %10
  br i1 %exitcond5, label %._crit_edge7.us, label %12

._crit_edge7.us:                                  ; preds = %19
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next7, %10
  br i1 %exitcond10, label %._crit_edge11.loopexit.loopexit, label %.lr.ph10.split.us

._crit_edge11.loopexit.loopexit:                  ; preds = %._crit_edge7.us
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge11.loopexit.loopexit, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %.lr.ph3, label %._crit_edge4

.lr.ph3:                                          ; preds = %._crit_edge11.loopexit
  %29 = sext i32 %1 to i64
  br i1 %9, label %.lr.ph3.split.us.preheader, label %._crit_edge4

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %30 = sext i32 %0 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv2 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next3, %._crit_edge.us ]
  %31 = mul nsw i64 %29, %indvars.iv2
  br label %32

; <label>:32:                                     ; preds = %39, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %39 ], [ 0, %.lr.ph3.split.us ]
  %33 = add nsw i64 %31, %indvars.iv
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 20
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %32
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %38) #6
  br label %39

; <label>:39:                                     ; preds = %37, %32
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %42) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %29
  br i1 %exitcond, label %._crit_edge.us, label %32

._crit_edge.us:                                   ; preds = %39
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, %30
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.lr.ph3, %._crit_edge11.loopexit
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %46) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
