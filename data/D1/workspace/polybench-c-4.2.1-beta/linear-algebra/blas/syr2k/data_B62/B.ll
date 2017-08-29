; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %._crit_edge9

._crit_edge.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.._crit_edge4.lr.ph_crit_edge

._crit_edge.lr.ph.._crit_edge4.lr.ph_crit_edge:   ; preds = %._crit_edge.lr.ph
  %.pre = zext i32 %0 to i64
  br label %._crit_edge4.lr.ph

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %wide.trip.count22 = zext i32 %1 to i64
  %wide.trip.count26 = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge12.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %._crit_edge.us
  %indvars.iv20 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next21, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv20, %indvars.iv24
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv20
  %19 = add nuw nsw i64 %13, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %1
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %10, i32 0
  %24 = insertelement <2 x double> %23, double %11, i32 1
  %25 = insertelement <2 x double> undef, double %17, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = fdiv <2 x double> %26, %24
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  store double %28, double* %18, align 8
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv20
  store double %29, double* %30, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %._crit_edge12.us, label %12

._crit_edge12.us:                                 ; preds = %12
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %._crit_edge4.lr.ph.loopexit, label %._crit_edge.us

._crit_edge4.lr.ph.loopexit:                      ; preds = %._crit_edge12.us
  br label %._crit_edge4.lr.ph

._crit_edge4.lr.ph:                               ; preds = %._crit_edge4.lr.ph.loopexit, %._crit_edge.lr.ph.._crit_edge4.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %._crit_edge.lr.ph.._crit_edge4.lr.ph_crit_edge ], [ %wide.trip.count26, %._crit_edge4.lr.ph.loopexit ]
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge6.us, %._crit_edge4.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge6.us ], [ 0, %._crit_edge4.lr.ph ]
  br label %31

; <label>:31:                                     ; preds = %31, %._crit_edge4.us
  %indvars.iv = phi i64 [ 0, %._crit_edge4.us ], [ %indvars.iv.next, %31 ]
  %32 = mul nuw nsw i64 %indvars.iv, %indvars.iv16
  %33 = add nuw nsw i64 %32, 3
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %11
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv16, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge6.us, label %31

._crit_edge6.us:                                  ; preds = %31
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count.pre-phi
  br i1 %exitcond19, label %._crit_edge9.loopexit, label %._crit_edge4.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %._crit_edge14

._crit_edge.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge.lr.ph
  %wide.trip.count56 = zext i32 %0 to i64
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %._crit_edge.lr.ph
  %wide.trip.count33 = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert133 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat134 = shufflevector <2 x double> %broadcast.splatinsert133, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader136, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader136 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %11 = bitcast double* %10 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %13 = insertelement <2 x double> undef, double %3, i32 0
  %14 = insertelement <2 x double> %13, double %3, i32 1
  %15 = fmul <2 x double> %12, %14
  %16 = bitcast double* %10 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %18 = bitcast double* %17 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %20 = insertelement <2 x double> undef, double %3, i32 0
  %21 = insertelement <2 x double> %20, double %3, i32 1
  %22 = fmul <2 x double> %19, %21
  %23 = bitcast double* %17 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %._crit_edge4.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

._crit_edge4.us15.preheader.loopexit:             ; preds = %.lr.ph.us.new
  br label %._crit_edge4.us15.preheader

._crit_edge4.us15.preheader:                      ; preds = %._crit_edge4.us15.preheader.loopexit, %middle.block111, %.prol.loopexit
  %n.vec72 = and i64 %80, -2
  br label %._crit_edge4.us15

._crit_edge4.us15:                                ; preds = %._crit_edge4.us15.preheader, %._crit_edge8.us19
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge8.us19 ], [ 0, %._crit_edge4.us15.preheader ]
  %24 = icmp ult i64 %80, 2
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %25 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %25
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep84 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %25
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %24, label %scalar.ph68.preheader, label %min.iters.checked70

min.iters.checked70:                              ; preds = %._crit_edge4.us15
  %28 = icmp eq i64 %n.vec72, 0
  br i1 %28, label %scalar.ph68.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked70
  %bound0 = icmp ult double* %scevgep, %27
  %bound1 = icmp ult double* %27, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bound087 = icmp ult double* %scevgep, %scevgep80
  %bound188 = icmp ult double* %scevgep78, %scevgep76
  %found.conflict89 = and i1 %bound087, %bound188
  %conflict.rdx = or i1 %found.conflict, %found.conflict89
  %bound090 = icmp ult double* %scevgep, %scevgep84
  %bound191 = icmp ult double* %scevgep82, %scevgep76
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx93 = or i1 %conflict.rdx, %found.conflict92
  %bound096 = icmp ult double* %scevgep, %26
  %bound197 = icmp ult double* %26, %scevgep76
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx99 = or i1 %conflict.rdx93, %found.conflict98
  br i1 %conflict.rdx99, label %scalar.ph68.preheader, label %vector.ph100

vector.ph100:                                     ; preds = %vector.memcheck
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %vector.ph100
  %index101 = phi i64 [ 0, %vector.ph100 ], [ %index.next102, %vector.body66 ]
  %29 = or i64 %index101, 1
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index101, i64 %indvars.iv31
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %29, i64 %indvars.iv31
  %32 = load double, double* %30, align 8, !alias.scope !5
  %33 = load double, double* %31, align 8, !alias.scope !5
  %34 = insertelement <2 x double> undef, double %32, i32 0
  %35 = insertelement <2 x double> %34, double %33, i32 1
  %36 = fmul <2 x double> %35, %broadcast.splat109
  %37 = load double, double* %26, align 8, !alias.scope !8
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  %40 = fmul <2 x double> %36, %39
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index101, i64 %indvars.iv31
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %29, i64 %indvars.iv31
  %43 = load double, double* %41, align 8, !alias.scope !10
  %44 = load double, double* %42, align 8, !alias.scope !10
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat109
  %48 = load double, double* %27, align 8, !alias.scope !12
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = fmul <2 x double> %47, %50
  %52 = fadd <2 x double> %40, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index101
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !14, !noalias !16
  %55 = fadd <2 x double> %wide.load, %52
  %56 = bitcast double* %53 to <2 x double>*
  store <2 x double> %55, <2 x double>* %56, align 8, !alias.scope !14, !noalias !16
  %index.next102 = add i64 %index101, 2
  %57 = icmp eq i64 %index.next102, %n.vec72
  br i1 %57, label %middle.block67, label %vector.body66, !llvm.loop !17

middle.block67:                                   ; preds = %vector.body66
  %58 = icmp eq i64 %80, %n.vec72
  br i1 %58, label %._crit_edge8.us19, label %scalar.ph68.preheader

scalar.ph68.preheader:                            ; preds = %middle.block67, %vector.memcheck, %min.iters.checked70, %._crit_edge4.us15
  %indvars.iv26.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked70 ], [ 0, %._crit_edge4.us15 ], [ %n.vec72, %middle.block67 ]
  br label %scalar.ph68

scalar.ph68:                                      ; preds = %scalar.ph68.preheader, %scalar.ph68
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %scalar.ph68 ], [ %indvars.iv26.ph, %scalar.ph68.preheader ]
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv31
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %2
  %62 = load double, double* %26, align 8
  %63 = fmul double %61, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv31
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %2
  %67 = load double, double* %27, align 8
  %68 = fmul double %66, %67
  %69 = fadd double %63, %68
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv26
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %indvars.iv36
  br i1 %exitcond, label %._crit_edge8.us19.loopexit, label %scalar.ph68, !llvm.loop !18

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge10.us
  %indvars.iv139 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next140, %._crit_edge10.us ]
  %indvars.iv38 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next39, %._crit_edge10.us ]
  %indvars.iv36 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next37, %._crit_edge10.us ]
  %73 = zext i2 %indvars.iv139 to i64
  %74 = add nuw nsw i64 %73, 4294967295
  %75 = and i64 %74, 4294967295
  %76 = add nuw nsw i64 %75, 1
  %77 = add nsw i64 %indvars.iv38, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %78 = mul i64 %indvars.iv38, 1201
  %79 = add i64 %78, 1
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %79
  %80 = add nuw nsw i64 %indvars.iv38, 1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %81 = trunc i64 %indvars.iv.next39 to i32
  %xtraiter = and i32 %81, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %3
  store double %84, double* %82, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %76, %.prol.loopexit.loopexit ]
  %85 = icmp ult i64 %indvars.iv38, 3
  br i1 %85, label %._crit_edge4.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %86 = sub i64 %77, %indvars.iv.unr
  %87 = lshr i64 %86, 2
  %88 = add nuw nsw i64 %87, 1
  %min.iters.check113 = icmp ult i64 %88, 2
  br i1 %min.iters.check113, label %.lr.ph.us.new.preheader136, label %min.iters.checked114

.lr.ph.us.new.preheader136:                       ; preds = %middle.block111, %min.iters.checked114, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked114 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end122, %middle.block111 ]
  br label %.lr.ph.us.new

min.iters.checked114:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf115 = and i64 %88, 1
  %n.vec116 = sub nsw i64 %88, %n.mod.vf115
  %cmp.zero117 = icmp eq i64 %n.vec116, 0
  %89 = add nsw i64 %indvars.iv.unr, 4
  %90 = shl nuw i64 %87, 2
  %91 = add i64 %89, %90
  %92 = shl nuw nsw i64 %n.mod.vf115, 2
  %ind.end122 = sub i64 %91, %92
  br i1 %cmp.zero117, label %.lr.ph.us.new.preheader136, label %vector.ph118

vector.ph118:                                     ; preds = %min.iters.checked114
  br label %vector.body110

vector.body110:                                   ; preds = %vector.body110, %vector.ph118
  %index119 = phi i64 [ 0, %vector.ph118 ], [ %index.next120, %vector.body110 ]
  %93 = shl i64 %index119, 2
  %94 = add i64 %indvars.iv.unr, %93
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %94
  %96 = bitcast double* %95 to <8 x double>*
  %wide.vec128 = load <8 x double>, <8 x double>* %96, align 8
  %strided.vec129 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec130 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec131 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec132 = shufflevector <8 x double> %wide.vec128, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %97 = fmul <2 x double> %strided.vec129, %broadcast.splat134
  %98 = fmul <2 x double> %strided.vec130, %broadcast.splat134
  %99 = fmul <2 x double> %strided.vec131, %broadcast.splat134
  %100 = add nsw i64 %94, 3
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %100
  %102 = fmul <2 x double> %strided.vec132, %broadcast.splat134
  %103 = getelementptr double, double* %101, i64 -3
  %104 = bitcast double* %103 to <8 x double>*
  %105 = shufflevector <2 x double> %97, <2 x double> %98, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %106 = shufflevector <2 x double> %99, <2 x double> %102, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec135 = shufflevector <4 x double> %105, <4 x double> %106, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec135, <8 x double>* %104, align 8
  %index.next120 = add i64 %index119, 2
  %107 = icmp eq i64 %index.next120, %n.vec116
  br i1 %107, label %middle.block111, label %vector.body110, !llvm.loop !21

middle.block111:                                  ; preds = %vector.body110
  %cmp.n123 = icmp eq i64 %n.mod.vf115, 0
  br i1 %cmp.n123, label %._crit_edge4.us15.preheader, label %.lr.ph.us.new.preheader136

._crit_edge8.us19.loopexit:                       ; preds = %scalar.ph68
  br label %._crit_edge8.us19

._crit_edge8.us19:                                ; preds = %._crit_edge8.us19.loopexit, %middle.block67
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge10.us, label %._crit_edge4.us15

._crit_edge10.us:                                 ; preds = %._crit_edge8.us19
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  %indvars.iv.next140 = add i2 %indvars.iv139, 1
  br i1 %exitcond41, label %._crit_edge14.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3
  %indvars.iv141 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next142, %._crit_edge3 ]
  %indvars.iv54 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next55, %._crit_edge3 ]
  %indvars.iv52 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next53, %._crit_edge3 ]
  %108 = zext i2 %indvars.iv141 to i64
  %109 = add nuw nsw i64 %108, 4294967295
  %110 = and i64 %109, 4294967295
  %111 = add nuw nsw i64 %110, 1
  %112 = add nsw i64 %indvars.iv54, -3
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %113 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter49 = and i32 %113, 3
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  br i1 %lcmp.mod50, label %.prol.loopexit48, label %.prol.preheader47.preheader

.prol.preheader47.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader47

.prol.preheader47:                                ; preds = %.prol.preheader47.preheader, %.prol.preheader47
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader47 ], [ 0, %.prol.preheader47.preheader ]
  %prol.iter51 = phi i32 [ %prol.iter51.sub, %.prol.preheader47 ], [ %xtraiter49, %.prol.preheader47.preheader ]
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv42.prol
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, %3
  store double %116, double* %114, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter51.sub = add nsw i32 %prol.iter51, -1
  %prol.iter51.cmp = icmp eq i32 %prol.iter51.sub, 0
  br i1 %prol.iter51.cmp, label %.prol.loopexit48.loopexit, label %.prol.preheader47, !llvm.loop !22

.prol.loopexit48.loopexit:                        ; preds = %.prol.preheader47
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.loopexit48.loopexit, %.lr.ph
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph ], [ %111, %.prol.loopexit48.loopexit ]
  %117 = icmp ult i64 %indvars.iv54, 3
  br i1 %117, label %._crit_edge3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit48
  %118 = sub i64 %112, %indvars.iv42.unr
  %119 = lshr i64 %118, 2
  %120 = add nuw nsw i64 %119, 1
  %min.iters.check = icmp ult i64 %120, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader137, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %120, 1
  %n.vec = sub nsw i64 %120, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %121 = add nsw i64 %indvars.iv42.unr, 4
  %122 = shl nuw i64 %119, 2
  %123 = add i64 %121, %122
  %124 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %123, %124
  br i1 %cmp.zero, label %.lr.ph.new.preheader137, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %125 = shl i64 %index, 2
  %126 = add i64 %indvars.iv42.unr, %125
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %126
  %128 = bitcast double* %127 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %128, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %129 = fmul <2 x double> %strided.vec, %broadcast.splat65
  %130 = fmul <2 x double> %strided.vec61, %broadcast.splat65
  %131 = fmul <2 x double> %strided.vec62, %broadcast.splat65
  %132 = add nsw i64 %126, 3
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %132
  %134 = fmul <2 x double> %strided.vec63, %broadcast.splat65
  %135 = getelementptr double, double* %133, i64 -3
  %136 = bitcast double* %135 to <8 x double>*
  %137 = shufflevector <2 x double> %129, <2 x double> %130, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %138 = shufflevector <2 x double> %131, <2 x double> %134, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %137, <4 x double> %138, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %136, align 8
  %index.next = add i64 %index, 2
  %139 = icmp eq i64 %index.next, %n.vec
  br i1 %139, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge3, label %.lr.ph.new.preheader137

.lr.ph.new.preheader137:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv42.ph = phi i64 [ %indvars.iv42.unr, %min.iters.checked ], [ %indvars.iv42.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader137, %.lr.ph.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %.lr.ph.new ], [ %indvars.iv42.ph, %.lr.ph.new.preheader137 ]
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv42
  %141 = bitcast double* %140 to <2 x double>*
  %142 = load <2 x double>, <2 x double>* %141, align 8
  %143 = insertelement <2 x double> undef, double %3, i32 0
  %144 = insertelement <2 x double> %143, double %3, i32 1
  %145 = fmul <2 x double> %142, %144
  %146 = bitcast double* %140 to <2 x double>*
  store <2 x double> %145, <2 x double>* %146, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next43.1
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %148, align 8
  %150 = insertelement <2 x double> undef, double %3, i32 0
  %151 = insertelement <2 x double> %150, double %3, i32 1
  %152 = fmul <2 x double> %149, %151
  %153 = bitcast double* %147 to <2 x double>*
  store <2 x double> %152, <2 x double>* %153, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next43.3, %indvars.iv52
  br i1 %exitcond46.3, label %._crit_edge3.loopexit, label %.lr.ph.new, !llvm.loop !24

._crit_edge3.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %middle.block, %.prol.loopexit48
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  %indvars.iv.next142 = add i2 %indvars.iv141, 1
  br i1 %exitcond57, label %._crit_edge14.loopexit143, label %.lr.ph

._crit_edge14.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge14

._crit_edge14.loopexit143:                        ; preds = %._crit_edge3
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit143, %._crit_edge14.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge6

._crit_edge.us.preheader:                         ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next8, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv7, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count
  br i1 %exitcond10, label %._crit_edge6.loopexit, label %._crit_edge.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!13}
!13 = distinct !{!13, !7}
!14 = !{!15}
!15 = distinct !{!15, !7}
!16 = !{!13, !6, !11, !9}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
