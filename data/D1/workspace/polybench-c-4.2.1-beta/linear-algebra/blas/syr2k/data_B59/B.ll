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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge9

.preheader5.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.lr.ph..preheader.lr.ph_crit_edge

.preheader5.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader5.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %wide.trip.count22 = zext i32 %1 to i64
  %wide.trip.count26 = zext i32 %0 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge12.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge12.us ], [ 0, %.preheader5.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader5.us
  %indvars.iv20 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next21, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv20, %indvars.iv24
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv24, i64 %indvars.iv20
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %13, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv20
  store double %24, double* %25, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %._crit_edge12.us, label %12

._crit_edge12.us:                                 ; preds = %12
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %.preheader.lr.ph.loopexit, label %.preheader5.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge12.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader5.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader5.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count26, %.preheader.lr.ph.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %26

; <label>:26:                                     ; preds = %26, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %26 ]
  %27 = mul nuw nsw i64 %indvars.iv, %indvars.iv16
  %28 = add nuw nsw i64 %27, 3
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %11
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv16, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %26
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count.pre-phi
  br i1 %exitcond19, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge14

.preheader5.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader5.lr.ph
  %wide.trip.count56 = zext i32 %0 to i64
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader5.lr.ph
  %wide.trip.count33 = zext i32 %1 to i64
  %wide.trip.count40 = zext i32 %0 to i64
  %broadcast.splatinsert111 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat112 = shufflevector <2 x double> %broadcast.splatinsert111, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert136 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat137 = shufflevector <2 x double> %broadcast.splatinsert136, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader139, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader139 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %.preheader.us16.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us16.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us16.preheader

.preheader.us16.preheader:                        ; preds = %.preheader.us16.preheader.loopexit, %middle.block114, %.prol.loopexit
  %min.iters.check72 = icmp ult i64 %71, 2
  %n.vec75 = and i64 %71, -2
  %cmp.zero76 = icmp eq i64 %n.vec75, 0
  %cmp.n107 = icmp eq i64 %71, %n.vec75
  br label %.preheader.us16

scalar.ph71:                                      ; preds = %scalar.ph71.preheader, %scalar.ph71
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %scalar.ph71 ], [ %indvars.iv26.ph, %scalar.ph71.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv31
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv26, i64 %indvars.iv31
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv26
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %indvars.iv36
  br i1 %exitcond, label %._crit_edge.us19.loopexit, label %scalar.ph71, !llvm.loop !5

.preheader.us16:                                  ; preds = %.preheader.us16.preheader, %._crit_edge.us19
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us19 ], [ 0, %.preheader.us16.preheader ]
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %36 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %36
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv31
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv31
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %min.iters.check72, label %scalar.ph71.preheader, label %min.iters.checked73

scalar.ph71.preheader:                            ; preds = %middle.block70, %vector.memcheck, %min.iters.checked73, %.preheader.us16
  %indvars.iv26.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked73 ], [ 0, %.preheader.us16 ], [ %n.vec75, %middle.block70 ]
  br label %scalar.ph71

min.iters.checked73:                              ; preds = %.preheader.us16
  br i1 %cmp.zero76, label %scalar.ph71.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked73
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep79
  %found.conflict = and i1 %bound0, %bound1
  %bound090 = icmp ult double* %scevgep, %scevgep83
  %bound191 = icmp ult double* %scevgep81, %scevgep79
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx = or i1 %found.conflict, %found.conflict92
  %bound093 = icmp ult double* %scevgep, %scevgep87
  %bound194 = icmp ult double* %scevgep85, %scevgep79
  %found.conflict95 = and i1 %bound093, %bound194
  %conflict.rdx96 = or i1 %conflict.rdx, %found.conflict95
  %bound099 = icmp ult double* %scevgep, %37
  %bound1100 = icmp ult double* %37, %scevgep79
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx102 = or i1 %conflict.rdx96, %found.conflict101
  br i1 %conflict.rdx102, label %scalar.ph71.preheader, label %vector.ph103

vector.ph103:                                     ; preds = %vector.memcheck
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69, %vector.ph103
  %index104 = phi i64 [ 0, %vector.ph103 ], [ %index.next105, %vector.body69 ]
  %39 = or i64 %index104, 1
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index104, i64 %indvars.iv31
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %39, i64 %indvars.iv31
  %42 = load double, double* %40, align 8, !alias.scope !6
  %43 = load double, double* %41, align 8, !alias.scope !6
  %44 = insertelement <2 x double> undef, double %42, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fmul <2 x double> %45, %broadcast.splat112
  %47 = load double, double* %37, align 8, !alias.scope !9
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = fmul <2 x double> %46, %49
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index104, i64 %indvars.iv31
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %39, i64 %indvars.iv31
  %53 = load double, double* %51, align 8, !alias.scope !11
  %54 = load double, double* %52, align 8, !alias.scope !11
  %55 = insertelement <2 x double> undef, double %53, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %56, %broadcast.splat112
  %58 = load double, double* %38, align 8, !alias.scope !13
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = fmul <2 x double> %57, %60
  %62 = fadd <2 x double> %50, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %index104
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next105 = add i64 %index104, 2
  %67 = icmp eq i64 %index.next105, %n.vec75
  br i1 %67, label %middle.block70, label %vector.body69, !llvm.loop !18

middle.block70:                                   ; preds = %vector.body69
  br i1 %cmp.n107, label %._crit_edge.us19, label %scalar.ph71.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge10.us
  %indvars.iv60 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next61, %._crit_edge10.us ]
  %indvars.iv38 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next39, %._crit_edge10.us ]
  %indvars.iv36 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next37, %._crit_edge10.us ]
  %68 = add nsw i64 %indvars.iv38, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %69 = mul i64 %indvars.iv38, 1201
  %70 = add i64 %69, 1
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %70
  %71 = add nuw nsw i64 %indvars.iv38, 1
  %72 = zext i2 %indvars.iv60 to i64
  %73 = add nuw nsw i64 %72, 4294967295
  %74 = and i64 %73, 4294967295
  %75 = add nuw nsw i64 %74, 1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %76 = trunc i64 %indvars.iv.next39 to i32
  %xtraiter = and i32 %76, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  store double %79, double* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %75, %.prol.loopexit.loopexit ]
  %80 = icmp ult i64 %indvars.iv38, 3
  br i1 %80, label %.preheader.us16.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %81 = sub i64 %68, %indvars.iv.unr
  %82 = lshr i64 %81, 2
  %83 = add nuw nsw i64 %82, 1
  %min.iters.check116 = icmp ult i64 %83, 2
  br i1 %min.iters.check116, label %.lr.ph.us.new.preheader139, label %min.iters.checked117

.lr.ph.us.new.preheader139:                       ; preds = %middle.block114, %min.iters.checked117, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked117 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end125, %middle.block114 ]
  br label %.lr.ph.us.new

min.iters.checked117:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf118 = and i64 %83, 1
  %n.vec119 = sub nsw i64 %83, %n.mod.vf118
  %cmp.zero120 = icmp eq i64 %n.vec119, 0
  %84 = add nsw i64 %indvars.iv.unr, 4
  %85 = shl nuw i64 %82, 2
  %86 = add i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf118, 2
  %ind.end125 = sub i64 %86, %87
  br i1 %cmp.zero120, label %.lr.ph.us.new.preheader139, label %vector.ph121

vector.ph121:                                     ; preds = %min.iters.checked117
  br label %vector.body113

vector.body113:                                   ; preds = %vector.body113, %vector.ph121
  %index122 = phi i64 [ 0, %vector.ph121 ], [ %index.next123, %vector.body113 ]
  %88 = shl i64 %index122, 2
  %89 = add i64 %indvars.iv.unr, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %89
  %91 = bitcast double* %90 to <8 x double>*
  %wide.vec131 = load <8 x double>, <8 x double>* %91, align 8
  %strided.vec132 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec133 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec134 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec135 = shufflevector <8 x double> %wide.vec131, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %92 = fmul <2 x double> %strided.vec132, %broadcast.splat137
  %93 = fmul <2 x double> %strided.vec133, %broadcast.splat137
  %94 = fmul <2 x double> %strided.vec134, %broadcast.splat137
  %95 = add nsw i64 %89, 3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %95
  %97 = fmul <2 x double> %strided.vec135, %broadcast.splat137
  %98 = getelementptr double, double* %96, i64 -3
  %99 = bitcast double* %98 to <8 x double>*
  %100 = shufflevector <2 x double> %92, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec138 = shufflevector <4 x double> %100, <4 x double> %101, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec138, <8 x double>* %99, align 8
  %index.next123 = add i64 %index122, 2
  %102 = icmp eq i64 %index.next123, %n.vec119
  br i1 %102, label %middle.block114, label %vector.body113, !llvm.loop !21

middle.block114:                                  ; preds = %vector.body113
  %cmp.n126 = icmp eq i64 %n.mod.vf118, 0
  br i1 %cmp.n126, label %.preheader.us16.preheader, label %.lr.ph.us.new.preheader139

._crit_edge.us19.loopexit:                        ; preds = %scalar.ph71
  br label %._crit_edge.us19

._crit_edge.us19:                                 ; preds = %._crit_edge.us19.loopexit, %middle.block70
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge10.us, label %.preheader.us16

._crit_edge10.us:                                 ; preds = %._crit_edge.us19
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  %indvars.iv.next61 = add i2 %indvars.iv60, 1
  br i1 %exitcond41, label %._crit_edge14.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader4
  %indvars.iv62 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next63, %.preheader4 ]
  %indvars.iv54 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next55, %.preheader4 ]
  %indvars.iv52 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next53, %.preheader4 ]
  %103 = add nsw i64 %indvars.iv54, -3
  %104 = zext i2 %indvars.iv62 to i64
  %105 = add nuw nsw i64 %104, 4294967295
  %106 = and i64 %105, 4294967295
  %107 = add nuw nsw i64 %106, 1
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %108 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter49 = and i32 %108, 3
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  br i1 %lcmp.mod50, label %.prol.loopexit48, label %.prol.preheader47.preheader

.prol.preheader47.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader47

.prol.preheader47:                                ; preds = %.prol.preheader47.preheader, %.prol.preheader47
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %.prol.preheader47 ], [ 0, %.prol.preheader47.preheader ]
  %prol.iter51 = phi i32 [ %prol.iter51.sub, %.prol.preheader47 ], [ %xtraiter49, %.prol.preheader47.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv42.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter51.sub = add nsw i32 %prol.iter51, -1
  %prol.iter51.cmp = icmp eq i32 %prol.iter51.sub, 0
  br i1 %prol.iter51.cmp, label %.prol.loopexit48.loopexit, label %.prol.preheader47, !llvm.loop !22

.prol.loopexit48.loopexit:                        ; preds = %.prol.preheader47
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.loopexit48.loopexit, %.lr.ph
  %indvars.iv42.unr = phi i64 [ 0, %.lr.ph ], [ %107, %.prol.loopexit48.loopexit ]
  %112 = icmp ult i64 %indvars.iv54, 3
  br i1 %112, label %.preheader4, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit48
  %113 = sub i64 %103, %indvars.iv42.unr
  %114 = lshr i64 %113, 2
  %115 = add nuw nsw i64 %114, 1
  %min.iters.check = icmp ult i64 %115, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader140, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %115, 1
  %n.vec = sub nsw i64 %115, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %116 = add nsw i64 %indvars.iv42.unr, 4
  %117 = shl nuw i64 %114, 2
  %118 = add i64 %116, %117
  %119 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %118, %119
  br i1 %cmp.zero, label %.lr.ph.new.preheader140, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %120 = shl i64 %index, 2
  %121 = add i64 %indvars.iv42.unr, %120
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %121
  %123 = bitcast double* %122 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %123, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %124 = fmul <2 x double> %strided.vec, %broadcast.splat68
  %125 = fmul <2 x double> %strided.vec64, %broadcast.splat68
  %126 = fmul <2 x double> %strided.vec65, %broadcast.splat68
  %127 = add nsw i64 %121, 3
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %127
  %129 = fmul <2 x double> %strided.vec66, %broadcast.splat68
  %130 = getelementptr double, double* %128, i64 -3
  %131 = bitcast double* %130 to <8 x double>*
  %132 = shufflevector <2 x double> %124, <2 x double> %125, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %133 = shufflevector <2 x double> %126, <2 x double> %129, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %132, <4 x double> %133, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %131, align 8
  %index.next = add i64 %index, 2
  %134 = icmp eq i64 %index.next, %n.vec
  br i1 %134, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader4, label %.lr.ph.new.preheader140

.lr.ph.new.preheader140:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv42.ph = phi i64 [ %indvars.iv42.unr, %min.iters.checked ], [ %indvars.iv42.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader140, %.lr.ph.new
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %.lr.ph.new ], [ %indvars.iv42.ph, %.lr.ph.new.preheader140 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv42
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next43
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next43.1
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv42, 3
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next43.2
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %3
  store double %146, double* %144, align 8
  %indvars.iv.next43.3 = add nsw i64 %indvars.iv42, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next43.3, %indvars.iv52
  br i1 %exitcond46.3, label %.preheader4.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader4.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block, %.prol.loopexit48
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  %indvars.iv.next63 = add i2 %indvars.iv62, 1
  br i1 %exitcond57, label %._crit_edge14.loopexit141, label %.lr.ph

._crit_edge14.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge14

._crit_edge14.loopexit141:                        ; preds = %.preheader4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit141, %._crit_edge14.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
