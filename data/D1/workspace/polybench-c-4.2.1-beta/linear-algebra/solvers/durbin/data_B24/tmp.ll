; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %4 = add nsw i32 %0, 1
  %wide.trip.count = zext i32 %0 to i64
  %5 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge2.prol.loopexit, label %._crit_edge2.prol.preheader

._crit_edge2.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge2.prol

._crit_edge2.prol:                                ; preds = %._crit_edge2.prol, %._crit_edge2.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge2.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge2.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge2.prol.preheader ], [ %prol.iter.sub, %._crit_edge2.prol ]
  %6 = trunc i64 %indvars.iv.prol to i32
  %7 = sub i32 %4, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %8, double* %9, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge2.prol.loopexit.unr-lcssa, label %._crit_edge2.prol, !llvm.loop !1

._crit_edge2.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge2.prol
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.loopexit:                       ; preds = %.lr.ph, %._crit_edge2.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge2.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %5, 3
  br i1 %10, label %._crit_edge1.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge2 ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = sub i32 %4, %11
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sub i32 %4, %15
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %19 = trunc i64 %indvars.iv.next.1 to i32
  %20 = sub i32 %4, %19
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %21, double* %22, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %23 = trunc i64 %indvars.iv.next.2 to i32
  %24 = sub i32 %4, %23
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %25, double* %26, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %._crit_edge1.loopexit.unr-lcssa, label %._crit_edge2

._crit_edge1.loopexit.unr-lcssa:                  ; preds = %._crit_edge2
  br label %._crit_edge1.loopexit

._crit_edge1.loopexit:                            ; preds = %._crit_edge2.prol.loopexit, %._crit_edge1.loopexit.unr-lcssa
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double*, double*) unnamed_addr #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph25.preheader, label %._crit_edge48

.lr.ph25.preheader:                               ; preds = %3
  %10 = load double, double* %1, align 8
  %11 = fsub double -0.000000e+00, %10
  %12 = add i32 %0, -1
  %wide.trip.count46 = zext i32 %12 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge20, %.lr.ph25.preheader
  %indvars.iv44 = phi i64 [ 1, %.lr.ph25.preheader ], [ %indvars.iv.next45, %._crit_edge20 ]
  %indvar = phi i64 [ 0, %.lr.ph25.preheader ], [ %58, %._crit_edge20 ]
  %13 = phi double [ %11, %.lr.ph25.preheader ], [ %65, %._crit_edge20 ]
  %14 = phi double [ 1.000000e+00, %.lr.ph25.preheader ], [ %60, %._crit_edge20 ]
  %15 = add i64 %indvar, 1
  %16 = shl i64 %indvar, 3
  %17 = fmul double %13, %13
  %18 = fsub double 1.000000e+00, %17
  %19 = add nsw i64 %indvars.iv44, -1
  %xtraiter = and i64 %15, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge49.prol.loopexit, label %._crit_edge49.prol.preheader

._crit_edge49.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge49.prol

._crit_edge49.prol:                               ; preds = %._crit_edge49.prol, %._crit_edge49.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge49.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge49.prol ]
  %20 = phi double [ 0.000000e+00, %._crit_edge49.prol.preheader ], [ %27, %._crit_edge49.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge49.prol.preheader ], [ %prol.iter.sub, %._crit_edge49.prol ]
  %21 = sub nsw i64 %19, %indvars.iv.prol
  %22 = getelementptr inbounds double, double* %1, i64 %21
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %20, %26
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge49.prol.loopexit.unr-lcssa, label %._crit_edge49.prol, !llvm.loop !3

._crit_edge49.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge49.prol
  br label %._crit_edge49.prol.loopexit

._crit_edge49.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge49.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %27, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %27, %._crit_edge49.prol.loopexit.unr-lcssa ]
  %28 = icmp ult i64 %indvar, 3
  br i1 %28, label %.lr.ph16, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge49.prol.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge49 ]
  %29 = phi double [ %.unr, %.lr.ph.new ], [ %57, %._crit_edge49 ]
  %30 = sub nsw i64 %19, %indvars.iv
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %29, %35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = sub nsw i64 %19, %indvars.iv.next
  %38 = getelementptr inbounds double, double* %1, i64 %37
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %36, %42
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %44 = sub nsw i64 %19, %indvars.iv.next.1
  %45 = getelementptr inbounds double, double* %1, i64 %44
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %43, %49
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %51 = sub nsw i64 %19, %indvars.iv.next.2
  %52 = getelementptr inbounds double, double* %1, i64 %51
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %50, %56
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.3, label %.lr.ph16.unr-lcssa, label %._crit_edge49

.lr.ph16.unr-lcssa:                               ; preds = %._crit_edge49
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %._crit_edge49.prol.loopexit, %.lr.ph16.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge49.prol.loopexit ], [ %57, %.lr.ph16.unr-lcssa ]
  %58 = add nuw nsw i64 %indvar, 1
  %59 = add nuw nsw i64 %16, 8
  %60 = fmul double %14, %18
  %61 = getelementptr inbounds double, double* %1, i64 %indvars.iv44
  %62 = load double, double* %61, align 8
  %63 = fadd double %.lcssa, %62
  %64 = fsub double -0.000000e+00, %63
  %65 = fdiv double %64, %60
  %min.iters.check = icmp ult i64 %58, 4
  br i1 %min.iters.check, label %._crit_edge50.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph16
  %n.vec = and i64 %58, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge50.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %65, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %66 = getelementptr inbounds double, double* %2, i64 %index
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %69, align 8
  %70 = sub nsw i64 %19, %index
  %71 = getelementptr inbounds double, double* %2, i64 %70
  %72 = getelementptr double, double* %71, i64 -1
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %73, align 8
  %reverse = shufflevector <2 x double> %wide.load53, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %74 = getelementptr double, double* %71, i64 -2
  %75 = getelementptr double, double* %74, i64 -1
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %76, align 8
  %reverse55 = shufflevector <2 x double> %wide.load54, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %77 = fmul <2 x double> %broadcast.splat57, %reverse
  %78 = fmul <2 x double> %broadcast.splat57, %reverse55
  %79 = fadd <2 x double> %wide.load, %77
  %80 = fadd <2 x double> %wide.load52, %78
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %index
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %79, <2 x double>* %82, align 16
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> %80, <2 x double>* %84, align 16
  %index.next = add i64 %index, 4
  %85 = icmp eq i64 %index.next, %n.vec
  br i1 %85, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %58, %n.vec
  br i1 %cmp.n, label %._crit_edge20, label %._crit_edge50.preheader

._crit_edge50.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph16
  %indvars.iv32.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph16 ], [ %n.vec, %middle.block ]
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.preheader, %._crit_edge50
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge50 ], [ %indvars.iv32.ph, %._crit_edge50.preheader ]
  %86 = getelementptr inbounds double, double* %2, i64 %indvars.iv32
  %87 = load double, double* %86, align 8
  %88 = sub nsw i64 %19, %indvars.iv32
  %89 = getelementptr inbounds double, double* %2, i64 %88
  %90 = load double, double* %89, align 8
  %91 = fmul double %65, %90
  %92 = fadd double %87, %91
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv32
  store double %92, double* %93, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, %indvars.iv44
  br i1 %exitcond37, label %._crit_edge20.loopexit, label %._crit_edge50, !llvm.loop !7

._crit_edge20.loopexit:                           ; preds = %._crit_edge50
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %59, i32 8, i1 false)
  %94 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  store double %65, double* %94, align 8
  %exitcond47 = icmp eq i64 %58, %wide.trip.count46
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br i1 %exitcond47, label %._crit_edge48.loopexit, label %.lr.ph

._crit_edge48.loopexit:                           ; preds = %._crit_edge20
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge1

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge1.loopexit, label %.lr.ph

._crit_edge1.loopexit:                            ; preds = %.lr.ph._crit_edge
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
