; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %7
  %9 = zext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  %11 = sext i32 %0 to i64
  %12 = sitofp i32 %0 to double
  %13 = sext i32 %1 to i64
  br i1 %10, label %._crit_edge.us.preheader, label %._crit_edge6.lr.ph

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge23.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge23.us ], [ 0, %._crit_edge.us.preheader ]
  %14 = add i64 %indvars.iv45, %9
  %15 = trunc i64 %14 to i32
  br label %16

; <label>:16:                                     ; preds = %._crit_edge.us, %16
  %indvars.iv43 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next44, %16 ]
  %17 = add nsw i64 %indvars.iv45, %indvars.iv43
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 100
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %12
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv43
  store double %21, double* %22, align 8
  %23 = trunc i64 %indvars.iv43 to i32
  %24 = sub i32 %15, %23
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %12
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv43
  store double %27, double* %28, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %29 = icmp slt i64 %indvars.iv.next44, %13
  br i1 %29, label %16, label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %16
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, 1
  %30 = icmp slt i64 %indvars.iv.next46, %11
  br i1 %30, label %._crit_edge.us, label %._crit_edge6.lr.ph.loopexit

._crit_edge6.lr.ph.loopexit:                      ; preds = %._crit_edge23.us
  br label %._crit_edge6.lr.ph

._crit_edge6.lr.ph:                               ; preds = %._crit_edge6.lr.ph.loopexit, %._crit_edge.lr.ph
  %31 = add i32 %0, 7
  %32 = add i32 %0, -2
  %33 = trunc i32 %31 to i3
  %34 = insertelement <2 x double> undef, double %12, i32 0
  %35 = insertelement <2 x double> %34, double %12, i32 1
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.lr.ph, %._crit_edge14
  %indvars.iv52 = phi i3 [ %33, %._crit_edge6.lr.ph ], [ %indvars.iv.next53, %._crit_edge14 ]
  %indvars.iv50.in = phi i64 [ 1, %._crit_edge6.lr.ph ], [ %indvars.iv50, %._crit_edge14 ]
  %indvar = phi i32 [ 0, %._crit_edge6.lr.ph ], [ %indvar.next, %._crit_edge14 ]
  %indvars.iv41 = phi i64 [ 0, %._crit_edge6.lr.ph ], [ %indvars.iv.next42, %._crit_edge14 ]
  %indvars.iv36 = phi i64 [ 1, %._crit_edge6.lr.ph ], [ %indvars.iv.next37, %._crit_edge14 ]
  %indvars.iv34 = phi i32 [ 1, %._crit_edge6.lr.ph ], [ %indvars.iv.next35, %._crit_edge14 ]
  %indvars.iv50 = add i64 %indvars.iv50.in, 1
  %36 = zext i3 %indvars.iv52 to i64
  %37 = add nuw nsw i64 %36, 4294967295
  %38 = and i64 %37, 4294967295
  %39 = add i64 %indvars.iv50, %38
  %40 = sub i32 %31, %indvar
  %41 = sub i32 %32, %indvar
  %42 = icmp slt i64 %indvars.iv41, 0
  br i1 %42, label %._crit_edge7, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge6
  %43 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %43, 0
  br i1 %lcmp.mod, label %.lr.ph.prol, label %.lr.ph.prol.loopexit

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %44 = trunc i64 %indvars.iv41 to i32
  %45 = srem i32 %44, 100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %12
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 0
  store double %47, double* %48, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %49 = icmp eq i32 %indvar, 0
  br i1 %49, label %._crit_edge7, label %.lr.ph.preheader49

.lr.ph.preheader49:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv34 to i64
  br label %.lr.ph

._crit_edge7.loopexit:                            ; preds = %.lr.ph
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.lr.ph.prol.loopexit, %._crit_edge6
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, 1
  %50 = icmp slt i64 %indvars.iv.next42, %11
  br i1 %50, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %._crit_edge7
  %xtraiter47 = and i32 %40, 7
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  br i1 %lcmp.mod48, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph13
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv38.prol = phi i64 [ %indvars.iv.next39.prol, %.prol.preheader ], [ %indvars.iv36, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter47, %.prol.preheader.preheader ]
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv38.prol
  store double -9.990000e+02, double* %51, align 8
  %indvars.iv.next39.prol = add nsw i64 %indvars.iv38.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph13
  %indvars.iv38.unr = phi i64 [ %indvars.iv36, %.lr.ph13 ], [ %39, %.prol.loopexit.loopexit ]
  %52 = icmp ult i32 %41, 7
  br i1 %52, label %._crit_edge14, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph13.new

.lr.ph:                                           ; preds = %.lr.ph.preheader49, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader49 ]
  %53 = add nsw i64 %indvars.iv41, %indvars.iv
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, 100
  %56 = sitofp i32 %55 to double
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = add nsw i64 %indvars.iv41, %indvars.iv.next
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 100
  %61 = sitofp i32 %60 to double
  %62 = insertelement <2 x double> undef, double %56, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fdiv <2 x double> %63, %35
  %65 = bitcast double* %57 to <2 x double>*
  store <2 x double> %64, <2 x double>* %65, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge7.loopexit, label %.lr.ph

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.7, %.lr.ph13.new ], [ %indvars.iv38.unr, %.lr.ph13.new.preheader ]
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv38
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39.1
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next39.2 = add nsw i64 %indvars.iv38, 3
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39.2
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next39.3 = add nsw i64 %indvars.iv38, 4
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39.3
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next39.4 = add nsw i64 %indvars.iv38, 5
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39.4
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next39.5 = add nsw i64 %indvars.iv38, 6
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39.5
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next39.6 = add nsw i64 %indvars.iv38, 7
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next39.6
  store double -9.990000e+02, double* %73, align 8
  %indvars.iv.next39.7 = add nsw i64 %indvars.iv38, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next39.7 to i32
  %exitcond40.7 = icmp eq i32 %lftr.wideiv.7, %0
  br i1 %exitcond40.7, label %._crit_edge14.loopexit, label %.lr.ph13.new

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.new
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.prol.loopexit, %._crit_edge7
  %74 = icmp slt i64 %indvars.iv.next42, %11
  %indvars.iv.next35 = add i32 %indvars.iv34, 1
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvar.next = add nuw i32 %indvar, 1
  %indvars.iv.next53 = add i3 %indvars.iv52, -1
  br i1 %74, label %._crit_edge6, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge14
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %7
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = fmul double %2, 0.000000e+00
  %12 = add nsw i64 %9, -1
  %13 = icmp sgt i32 %1, 0
  %min.iters.check = icmp ult i32 %1, 4
  %14 = insertelement <2 x double> undef, double %3, i32 0
  %15 = insertelement <2 x double> %14, double %3, i32 1
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert63 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat64 = shufflevector <2 x double> %broadcast.splatinsert63, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert65 = insertelement <2 x double> undef, double %11, i32 0
  %broadcast.splat66 = shufflevector <2 x double> %broadcast.splatinsert65, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.lr.ph, %._crit_edge10
  %indvar = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvar.next, %._crit_edge10 ]
  %indvars.iv42 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next43, %._crit_edge10 ]
  %indvars.iv38 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next39, %._crit_edge10 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 0
  %scevgep47 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvar, i64 %9
  %scevgep49 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvar, i64 %9
  %16 = and i64 %indvars.iv42, 4294967295
  br i1 %13, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %._crit_edge
  %17 = icmp sgt i64 %indvars.iv38, 0
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv38
  br i1 %17, label %.lr.ph9.split.us.preheader, label %.lr.ph9.split.preheader

.lr.ph9.split.us.preheader:                       ; preds = %.lr.ph9
  br label %.lr.ph9.split.us

.lr.ph9.split.preheader:                          ; preds = %.lr.ph9
  br i1 %min.iters.check, label %.lr.ph9.split.preheader68, label %min.iters.checked

.lr.ph9.split.preheader68:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph9.split.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph9.split.preheader ], [ %n.vec, %middle.block ]
  %19 = sub nsw i64 %9, %indvars.iv.ph
  %xtraiter = and i64 %19, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph9.split.prol.loopexit.unr-lcssa, label %.lr.ph9.split.prol.preheader

.lr.ph9.split.prol.preheader:                     ; preds = %.lr.ph9.split.preheader68
  br label %.lr.ph9.split.prol

.lr.ph9.split.prol:                               ; preds = %.lr.ph9.split.prol.preheader
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.ph
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %3
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv.ph
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %2
  %26 = load double, double* %18, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %22, %27
  %29 = fadd double %28, %11
  store double %29, double* %20, align 8
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %.lr.ph9.split.prol.loopexit.unr-lcssa

.lr.ph9.split.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph9.split.preheader68, %.lr.ph9.split.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.lr.ph9.split.prol ], [ %indvars.iv.ph, %.lr.ph9.split.preheader68 ]
  br label %.lr.ph9.split.prol.loopexit

.lr.ph9.split.prol.loopexit:                      ; preds = %.lr.ph9.split.prol.loopexit.unr-lcssa
  %30 = icmp eq i64 %12, %indvars.iv.ph
  br i1 %30, label %._crit_edge10.loopexit69, label %.lr.ph9.split.preheader68.new

.lr.ph9.split.preheader68.new:                    ; preds = %.lr.ph9.split.prol.loopexit
  br label %.lr.ph9.split

min.iters.checked:                                ; preds = %.lr.ph9.split.preheader
  br i1 %cmp.zero, label %.lr.ph9.split.preheader68, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep51
  %bound1 = icmp ult double* %scevgep49, %scevgep47
  %found.conflict = and i1 %bound0, %bound1
  %bound054 = icmp ult double* %scevgep, %18
  %bound155 = icmp ult double* %18, %scevgep47
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx = or i1 %found.conflict, %found.conflict56
  br i1 %conflict.rdx, label %.lr.ph9.split.preheader68, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !3, !noalias !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !3, !noalias !6
  %35 = fmul <2 x double> %wide.load, %broadcast.splat60
  %36 = fmul <2 x double> %wide.load58, %broadcast.splat60
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv38, i64 %index
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !9
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !9
  %41 = fmul <2 x double> %wide.load61, %broadcast.splat64
  %42 = fmul <2 x double> %wide.load62, %broadcast.splat64
  %43 = load double, double* %18, align 8, !alias.scope !10
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = insertelement <2 x double> undef, double %43, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = fmul <2 x double> %41, %45
  %49 = fmul <2 x double> %42, %47
  %50 = fadd <2 x double> %35, %48
  %51 = fadd <2 x double> %36, %49
  %52 = fadd <2 x double> %50, %broadcast.splat66
  %53 = fadd <2 x double> %51, %broadcast.splat66
  %54 = bitcast double* %31 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !3, !noalias !6
  %55 = bitcast double* %33 to <2 x double>*
  store <2 x double> %53, <2 x double>* %55, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 4
  %56 = icmp eq i64 %index.next, %n.vec
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge10, label %.lr.ph9.split.preheader68

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %._crit_edge5.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge5.us ], [ 0, %.lr.ph9.split.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv34
  br label %58

; <label>:58:                                     ; preds = %58, %.lr.ph9.split.us
  %indvars.iv28 = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next29, %58 ]
  %59 = phi double [ 0.000000e+00, %.lr.ph9.split.us ], [ %72, %58 ]
  %60 = load double, double* %57, align 8
  %61 = fmul double %60, %2
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv28
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv34
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  store double %67, double* %65, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv28, i64 %indvars.iv34
  %69 = load double, double* %68, align 8
  %70 = load double, double* %62, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %59, %71
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next29, %16
  br i1 %exitcond44, label %._crit_edge5.us, label %58

._crit_edge5.us:                                  ; preds = %58
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv34
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %3
  %76 = load double, double* %57, align 8
  %77 = fmul double %76, %2
  %78 = load double, double* %18, align 8
  %79 = fmul double %77, %78
  %80 = fadd double %75, %79
  %81 = fmul double %72, %2
  %82 = fadd double %80, %81
  store double %82, double* %73, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, %9
  br i1 %exitcond, label %._crit_edge10.loopexit, label %.lr.ph9.split.us

.lr.ph9.split:                                    ; preds = %.lr.ph9.split, %.lr.ph9.split.preheader68.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph9.split.preheader68.new ], [ %indvars.iv.next.1, %.lr.ph9.split ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %84 = bitcast double* %83 to <2 x double>*
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %2
  %88 = load double, double* %18, align 8
  %89 = fmul double %87, %88
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %91 = load <2 x double>, <2 x double>* %84, align 8
  %92 = fmul <2 x double> %91, %15
  %93 = extractelement <2 x double> %92, i32 0
  %94 = extractelement <2 x double> %92, i32 1
  %95 = fadd double %93, %89
  %96 = fadd double %95, %11
  store double %96, double* %83, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv.next
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, %2
  %100 = load double, double* %18, align 8
  %101 = fmul double %99, %100
  %102 = fadd double %94, %101
  %103 = fadd double %102, %11
  store double %103, double* %90, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next.1, %9
  br i1 %exitcond41.1, label %._crit_edge10.loopexit69.unr-lcssa, label %.lr.ph9.split, !llvm.loop !14

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10.loopexit69.unr-lcssa:               ; preds = %.lr.ph9.split
  br label %._crit_edge10.loopexit69

._crit_edge10.loopexit69:                         ; preds = %.lr.ph9.split.prol.loopexit, %._crit_edge10.loopexit69.unr-lcssa
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit69, %._crit_edge10.loopexit, %middle.block, %._crit_edge
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %indvars.iv.next43 = add nuw nsw i64 %16, 1
  %104 = icmp slt i64 %indvars.iv.next39, %10
  %indvar.next = add i64 %indvar, 1
  br i1 %104, label %._crit_edge, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4.us ], [ 0, %._crit_edge.us.preheader ]
  %11 = mul nsw i64 %10, %indvars.iv13
  br label %12

; <label>:12:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge2.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %12

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %23 = icmp slt i64 %indvars.iv.next14, %10
  br i1 %23, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !5}
!9 = !{!7}
!10 = !{!8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
