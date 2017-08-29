; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge7

.preheader3.lr.ph:                                ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %7 = icmp eq i32 %xtraiter, 0
  %8 = icmp eq i32 %0, 1
  %9 = insertelement <2 x double> undef, double %5, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge5.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge5.us ], [ 0, %.preheader3.lr.ph ]
  %11 = trunc i64 %indvars.iv19 to i32
  %12 = add i32 %11, %0
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, %6
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us.us ]
  %13 = trunc i64 %indvars.iv16 to i32
  %14 = add i32 %12, %13
  br i1 %7, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, %5
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv19, i64 %indvars.iv16, i64 0
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv19, i64 %indvars.iv16, i64 0
  store double %17, double* %19, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %8, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next17, %6
  br i1 %exitcond23, label %._crit_edge5.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = sub i32 %14, %20
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv19, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sub i32 %14, %25
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %29, <double 1.000000e+01, double 1.000000e+01>
  %31 = fdiv <2 x double> %30, %10
  %32 = bitcast double* %23 to <2 x double>*
  %33 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  store <2 x double> %31, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %6
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge7.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %6 = zext i32 %5 to i64
  %7 = add nsw i64 %6, -1
  %8 = icmp sgt i32 %5, 1
  %min.iters.check65 = icmp ult i64 %7, 2
  %n.vec68 = and i64 %7, -2
  %cmp.zero69 = icmp eq i64 %n.vec68, 0
  %ind.end92 = or i64 %7, 1
  %cmp.n93 = icmp eq i64 %7, %n.vec68
  %min.iters.check = icmp ult i64 %7, 2
  %n.vec = and i64 %7, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %7, 1
  %cmp.n = icmp eq i64 %7, %n.vec
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge21, %4
  %9 = phi i32 [ 1, %4 ], [ %160, %._crit_edge21 ]
  br i1 %8, label %.preheader10.preheader, label %._crit_edge21

.preheader10.preheader:                           ; preds = %.preheader12
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.preheader, %._crit_edge14
  %indvar71 = phi i64 [ %indvar.next72, %._crit_edge14 ], [ 0, %.preheader10.preheader ]
  %indvars.iv27 = phi i64 [ %12, %._crit_edge14 ], [ 1, %.preheader10.preheader ]
  %10 = add i64 %indvar71, 1
  %11 = add i64 %indvar71, 2
  %12 = add nuw nsw i64 %indvars.iv27, 1
  %13 = add nsw i64 %indvars.iv27, -1
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge.us, %.preheader10
  %indvar73 = phi i64 [ %indvar.next74, %._crit_edge.us ], [ 0, %.preheader10 ]
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge.us ], [ 1, %.preheader10 ]
  %14 = add i64 %indvar73, 1
  %scevgep75 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 1
  %scevgep77 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 %6
  %scevgep79 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar71, i64 %14, i64 1
  %scevgep81 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %14, i64 %6
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %15 = add nsw i64 %indvars.iv23, -1
  br i1 %min.iters.check65, label %scalar.ph64.preheader, label %min.iters.checked66

min.iters.checked66:                              ; preds = %.preheader8.us
  br i1 %cmp.zero69, label %scalar.ph64.preheader, label %vector.memcheck87

vector.memcheck87:                                ; preds = %min.iters.checked66
  %bound083 = icmp ult double* %scevgep75, %scevgep81
  %bound184 = icmp ult double* %scevgep79, %scevgep77
  %memcheck.conflict86 = and i1 %bound083, %bound184
  br i1 %memcheck.conflict86, label %scalar.ph64.preheader, label %vector.body62.preheader

vector.body62.preheader:                          ; preds = %vector.memcheck87
  br label %vector.body62

vector.body62:                                    ; preds = %vector.body62.preheader, %vector.body62
  %index89 = phi i64 [ %index.next90, %vector.body62 ], [ 0, %vector.body62.preheader ]
  %offset.idx94 = or i64 %index89, 1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv23, i64 %offset.idx94
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %offset.idx94
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fmul <2 x double> %wide.load99, <double 2.000000e+00, double 2.000000e+00>
  %21 = fsub <2 x double> %wide.load98, %20
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %indvars.iv23, i64 %offset.idx94
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %wide.load100, %21
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %offset.idx94
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fsub <2 x double> %wide.load101, %20
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %15, i64 %offset.idx94
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %28, %wide.load102
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %25, %32
  %34 = add nuw nsw i64 %offset.idx94, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fsub <2 x double> %wide.load103, %20
  %38 = add nsw i64 %offset.idx94, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %37, %wide.load104
  %42 = fmul <2 x double> %41, <double 1.250000e-01, double 1.250000e-01>
  %43 = fadd <2 x double> %33, %42
  %44 = fadd <2 x double> %wide.load99, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv27, i64 %indvars.iv23, i64 %offset.idx94
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8, !alias.scope !4, !noalias !1
  %index.next90 = add i64 %index89, 2
  %47 = icmp eq i64 %index.next90, %n.vec68
  br i1 %47, label %middle.block63, label %vector.body62, !llvm.loop !6

middle.block63:                                   ; preds = %vector.body62
  br i1 %cmp.n93, label %._crit_edge.us, label %scalar.ph64.preheader

scalar.ph64.preheader:                            ; preds = %middle.block63, %vector.memcheck87, %min.iters.checked66, %.preheader8.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck87 ], [ 1, %min.iters.checked66 ], [ 1, %.preheader8.us ], [ %ind.end92, %middle.block63 ]
  br label %scalar.ph64

scalar.ph64:                                      ; preds = %scalar.ph64.preheader, %scalar.ph64
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph64 ], [ %indvars.iv.ph, %scalar.ph64.preheader ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv23, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 2.000000e+00
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %indvars.iv23, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = insertelement <2 x double> undef, double %52, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = insertelement <2 x double> undef, double %49, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fsub <2 x double> %60, %58
  %62 = extractelement <2 x double> %61, i32 0
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %15, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = insertelement <2 x double> undef, double %62, i32 0
  %66 = insertelement <2 x double> %65, double %64, i32 1
  %67 = insertelement <2 x double> undef, double %54, i32 0
  %68 = shufflevector <2 x double> %67, <2 x double> %61, <2 x i32> <i32 0, i32 3>
  %69 = fadd <2 x double> %68, %66
  %70 = fmul <2 x double> %69, <double 1.250000e-01, double 1.250000e-01>
  %71 = extractelement <2 x double> %70, i32 0
  %72 = extractelement <2 x double> %70, i32 1
  %73 = fadd double %71, %72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv.next
  %75 = load double, double* %74, align 8
  %76 = fsub double %75, %52
  %77 = add nsw i64 %indvars.iv, -1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %76, %79
  %81 = fmul double %80, 1.250000e-01
  %82 = fadd double %73, %81
  %83 = fadd double %51, %82
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %83, double* %84, align 8
  %exitcond44 = icmp eq i64 %indvars.iv.next, %6
  br i1 %exitcond44, label %._crit_edge.us.loopexit, label %scalar.ph64, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block63
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %6
  %indvar.next74 = add i64 %indvar73, 1
  br i1 %exitcond26, label %._crit_edge14, label %.preheader8.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %exitcond = icmp eq i64 %12, %6
  %indvar.next72 = add i64 %indvar71, 1
  br i1 %exitcond, label %.preheader.lr.ph.preheader, label %.preheader10

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge14
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge19
  %indvar = phi i64 [ %indvar.next, %._crit_edge19 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv39 = phi i64 [ %87, %._crit_edge19 ], [ 1, %.preheader.lr.ph.preheader ]
  %85 = add i64 %indvar, 1
  %86 = add i64 %indvar, 2
  %87 = add nuw nsw i64 %indvars.iv39, 1
  %88 = add nsw i64 %indvars.iv39, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge17.us, %.preheader.lr.ph
  %indvar47 = phi i64 [ %indvar.next48, %._crit_edge17.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge17.us ], [ 1, %.preheader.lr.ph ]
  %89 = add i64 %indvar47, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %89, i64 1
  %scevgep50 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %89, i64 %6
  %scevgep52 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %89, i64 1
  %scevgep54 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %86, i64 %89, i64 %6
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %90 = add nsw i64 %indvars.iv35, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ult double* %scevgep52, %scevgep50
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %87, i64 %indvars.iv35, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fmul <2 x double> %wide.load56, <double 2.000000e+00, double 2.000000e+00>
  %96 = fsub <2 x double> %wide.load, %95
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %88, i64 %indvars.iv35, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fadd <2 x double> %wide.load57, %96
  %100 = fmul <2 x double> %99, <double 1.250000e-01, double 1.250000e-01>
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %offset.idx
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fsub <2 x double> %wide.load58, %95
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %90, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = fadd <2 x double> %103, %wide.load59
  %107 = fmul <2 x double> %106, <double 1.250000e-01, double 1.250000e-01>
  %108 = fadd <2 x double> %100, %107
  %109 = add nuw nsw i64 %offset.idx, 1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fsub <2 x double> %wide.load60, %95
  %113 = add nsw i64 %offset.idx, -1
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %113
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = fadd <2 x double> %112, %wide.load61
  %117 = fmul <2 x double> %116, <double 1.250000e-01, double 1.250000e-01>
  %118 = fadd <2 x double> %108, %117
  %119 = fadd <2 x double> %wide.load56, %118
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %offset.idx
  %121 = bitcast double* %120 to <2 x double>*
  store <2 x double> %119, <2 x double>* %121, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %122 = icmp eq i64 %index.next, %n.vec
  br i1 %122, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge17.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv31.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %scalar.ph ], [ %indvars.iv31.ph, %scalar.ph.preheader ]
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %87, i64 %indvars.iv35, i64 %indvars.iv31
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, 2.000000e+00
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %88, i64 %indvars.iv35, i64 %indvars.iv31
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %indvars.iv31
  %131 = load double, double* %130, align 8
  %132 = insertelement <2 x double> undef, double %127, i32 0
  %133 = shufflevector <2 x double> %132, <2 x double> undef, <2 x i32> zeroinitializer
  %134 = insertelement <2 x double> undef, double %124, i32 0
  %135 = insertelement <2 x double> %134, double %131, i32 1
  %136 = fsub <2 x double> %135, %133
  %137 = extractelement <2 x double> %136, i32 0
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %90, i64 %indvars.iv31
  %139 = load double, double* %138, align 8
  %140 = insertelement <2 x double> undef, double %137, i32 0
  %141 = insertelement <2 x double> %140, double %139, i32 1
  %142 = insertelement <2 x double> undef, double %129, i32 0
  %143 = shufflevector <2 x double> %142, <2 x double> %136, <2 x i32> <i32 0, i32 3>
  %144 = fadd <2 x double> %143, %141
  %145 = fmul <2 x double> %144, <double 1.250000e-01, double 1.250000e-01>
  %146 = extractelement <2 x double> %145, i32 0
  %147 = extractelement <2 x double> %145, i32 1
  %148 = fadd double %146, %147
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %149 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next32
  %150 = load double, double* %149, align 8
  %151 = fsub double %150, %127
  %152 = add nsw i64 %indvars.iv31, -1
  %153 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %152
  %154 = load double, double* %153, align 8
  %155 = fadd double %151, %154
  %156 = fmul double %155, 1.250000e-01
  %157 = fadd double %148, %156
  %158 = fadd double %126, %157
  %159 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  store double %158, double* %159, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next32, %6
  br i1 %exitcond45, label %._crit_edge17.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge17.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %6
  %indvar.next48 = add i64 %indvar47, 1
  br i1 %exitcond38, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %exitcond46 = icmp eq i64 %87, %6
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond46, label %._crit_edge21.loopexit, label %.preheader.lr.ph

._crit_edge21.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader12
  %160 = add nuw nsw i32 %9, 1
  %exitcond43 = icmp eq i32 %160, 501
  br i1 %exitcond43, label %161, label %.preheader12

; <label>:161:                                    ; preds = %._crit_edge21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %10 = mul nsw i64 %indvars.iv22, %8
  %11 = trunc i64 %10 to i32
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge4.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next23, %9
  br i1 %exitcond27, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge4.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge4.us.us ]
  %12 = trunc i64 %indvars.iv18 to i32
  %13 = add i32 %12, %11
  %14 = mul i32 %13, %0
  %15 = zext i32 %14 to i64
  br label %16

._crit_edge4.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %9
  br i1 %exitcond, label %._crit_edge6.us, label %.preheader.us.us

; <label>:16:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %17 = add i64 %indvars.iv, %15
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 20
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %._crit_edge.us.us

; <label>:21:                                     ; preds = %16
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %21, %16
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond26, label %._crit_edge4.us.us, label %16

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
