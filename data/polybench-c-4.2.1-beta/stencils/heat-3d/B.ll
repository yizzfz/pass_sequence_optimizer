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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge3.us.us.preheader

._crit_edge3.us.us.preheader:                     ; preds = %._crit_edge.lr.ph, %._crit_edge7.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge7.us ], [ 0, %._crit_edge.lr.ph ]
  %3 = trunc i64 %indvars.iv23 to i32
  %4 = add i32 %3, 120
  br label %._crit_edge3.us.us

._crit_edge7.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond30, label %._crit_edge9, label %._crit_edge3.us.us.preheader

._crit_edge3.us.us:                               ; preds = %._crit_edge5.us.us, %._crit_edge3.us.us.preheader
  %indvars.iv19 = phi i64 [ 0, %._crit_edge3.us.us.preheader ], [ %indvars.iv.next20, %._crit_edge5.us.us ]
  %5 = trunc i64 %indvars.iv19 to i32
  %6 = add i32 %4, %5
  br label %._crit_edge3.us.us.new

._crit_edge5.us.us:                               ; preds = %._crit_edge3.us.us.new
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 120
  br i1 %exitcond, label %._crit_edge7.us, label %._crit_edge3.us.us

._crit_edge3.us.us.new:                           ; preds = %._crit_edge3.us.us, %._crit_edge3.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge3.us.us.new ], [ 0, %._crit_edge3.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 1.000000e+01
  %11 = fdiv double %10, 1.200000e+02
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  store double %11, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sub i32 %6, %14
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond28.1, label %._crit_edge5.us.us, label %._crit_edge3.us.us.new

._crit_edge9:                                     ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge17, %3
  %.0518 = phi i32 [ 1, %3 ], [ %138, %._crit_edge17 ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %._crit_edge9
  %indvar66 = phi i64 [ 0, %._crit_edge ], [ %indvar.next67, %._crit_edge9 ]
  %indvars.iv23 = phi i64 [ 1, %._crit_edge ], [ %indvars.iv.next24, %._crit_edge9 ]
  %4 = add i64 %indvar66, 1
  %5 = add i64 %indvar66, 2
  %6 = add nuw nsw i64 %indvars.iv23, 1
  %7 = add nsw i64 %indvars.iv23, -1
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge7.us, %._crit_edge1
  %indvar68 = phi i64 [ %indvar.next69, %._crit_edge7.us ], [ 0, %._crit_edge1 ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge7.us ], [ 1, %._crit_edge1 ]
  %8 = add i64 %indvar68, 1
  %scevgep70 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 1
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 119
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar66, i64 %8, i64 1
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 119
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %9 = add nsw i64 %indvars.iv19, -1
  %bound078 = icmp ult double* %scevgep70, %scevgep76
  %bound179 = icmp ult double* %scevgep74, %scevgep72
  %memcheck.conflict81 = and i1 %bound078, %bound179
  br i1 %memcheck.conflict81, label %scalar.ph63.preheader, label %vector.body61.preheader

vector.body61.preheader:                          ; preds = %._crit_edge3.us
  br label %vector.body61

scalar.ph63.preheader:                            ; preds = %._crit_edge3.us
  br label %scalar.ph63

vector.body61:                                    ; preds = %vector.body61.preheader, %vector.body61
  %index84 = phi i64 [ %index.next85, %vector.body61 ], [ 0, %vector.body61.preheader ]
  %offset.idx88 = or i64 %index84, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv19, i64 %offset.idx88
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %offset.idx88
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load93, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load92, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv19, i64 %offset.idx88
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load94, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv.next20, i64 %offset.idx88
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load95, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %9, i64 %offset.idx88
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load96
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx88, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load97, %14
  %32 = add nsw i64 %offset.idx88, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load98
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load93, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv23, i64 %indvars.iv19, i64 %offset.idx88
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next85 = add i64 %index84, 2
  %41 = icmp eq i64 %index.next85, 118
  br i1 %41, label %._crit_edge7.us.loopexit100, label %vector.body61, !llvm.loop !6

scalar.ph63:                                      ; preds = %scalar.ph63.preheader, %scalar.ph63
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph63 ], [ 1, %scalar.ph63.preheader ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv19, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = fsub double %43, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv19, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  %51 = fmul double %50, 1.250000e-01
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv.next20, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %46
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %9, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 1.250000e-01
  %59 = fadd double %51, %58
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %46
  %63 = add nsw i64 %indvars.iv, -1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv23, i64 %indvars.iv19, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %62, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %59, %67
  %69 = fadd double %45, %68
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond41 = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond41, label %._crit_edge7.us.loopexit, label %scalar.ph63, !llvm.loop !9

._crit_edge7.us.loopexit:                         ; preds = %scalar.ph63
  br label %._crit_edge7.us

._crit_edge7.us.loopexit100:                      ; preds = %vector.body61
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit100, %._crit_edge7.us.loopexit
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 119
  %indvar.next69 = add i64 %indvar68, 1
  br i1 %exitcond22, label %._crit_edge9, label %._crit_edge3.us

._crit_edge9:                                     ; preds = %._crit_edge7.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 119
  %indvar.next67 = add i64 %indvar66, 1
  br i1 %exitcond, label %._crit_edge5.lr.ph.preheader, label %._crit_edge1

._crit_edge5.lr.ph.preheader:                     ; preds = %._crit_edge9
  br label %._crit_edge5.lr.ph

._crit_edge5.lr.ph:                               ; preds = %._crit_edge5.lr.ph.preheader, %._crit_edge15
  %indvar = phi i64 [ %indvar.next, %._crit_edge15 ], [ 0, %._crit_edge5.lr.ph.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge15 ], [ 1, %._crit_edge5.lr.ph.preheader ]
  %71 = add i64 %indvar, 1
  %72 = add i64 %indvar, 2
  %73 = add nuw nsw i64 %indvars.iv35, 1
  %74 = add nsw i64 %indvars.iv35, -1
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge13.us, %._crit_edge5.lr.ph
  %indvar46 = phi i64 [ %indvar.next47, %._crit_edge13.us ], [ 0, %._crit_edge5.lr.ph ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge13.us ], [ 1, %._crit_edge5.lr.ph ]
  %75 = add i64 %indvar46, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %75, i64 1
  %scevgep49 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %75, i64 119
  %scevgep51 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %75, i64 1
  %scevgep53 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %75, i64 119
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %76 = add nsw i64 %indvars.iv31, -1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge5.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge5.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %73, i64 %indvars.iv31, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv31, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fmul <2 x double> %wide.load55, <double 2.000000e+00, double 2.000000e+00>
  %82 = fsub <2 x double> %wide.load, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %74, i64 %indvars.iv31, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %wide.load56, %82
  %86 = fmul <2 x double> %85, <double 1.250000e-01, double 1.250000e-01>
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv.next32, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fsub <2 x double> %wide.load57, %81
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %76, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %89, %wide.load58
  %93 = fmul <2 x double> %92, <double 1.250000e-01, double 1.250000e-01>
  %94 = fadd <2 x double> %86, %93
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv31, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fsub <2 x double> %wide.load59, %81
  %99 = add nsw i64 %offset.idx, -1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv31, i64 %99
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %98, %wide.load60
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %94, %103
  %105 = fadd <2 x double> %wide.load55, %104
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv35, i64 %indvars.iv31, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %108 = icmp eq i64 %index.next, 118
  br i1 %108, label %._crit_edge13.us.loopexit99, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %73, i64 %indvars.iv31, i64 %indvars.iv27
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv27
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 2.000000e+00
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %74, i64 %indvars.iv31, i64 %indvars.iv27
  %116 = load double, double* %115, align 8
  %117 = fadd double %116, %114
  %118 = fmul double %117, 1.250000e-01
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv.next32, i64 %indvars.iv27
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %113
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %76, i64 %indvars.iv27
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = fmul double %124, 1.250000e-01
  %126 = fadd double %118, %125
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv.next28
  %128 = load double, double* %127, align 8
  %129 = fsub double %128, %113
  %130 = add nsw i64 %indvars.iv27, -1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv35, i64 %indvars.iv31, i64 %130
  %132 = load double, double* %131, align 8
  %133 = fadd double %129, %132
  %134 = fmul double %133, 1.250000e-01
  %135 = fadd double %126, %134
  %136 = fadd double %112, %135
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv27
  store double %136, double* %137, align 8
  %exitcond43 = icmp eq i64 %indvars.iv.next28, 119
  br i1 %exitcond43, label %._crit_edge13.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge13.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge13.us

._crit_edge13.us.loopexit99:                      ; preds = %vector.body
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit99, %._crit_edge13.us.loopexit
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 119
  %indvar.next47 = add i64 %indvar46, 1
  br i1 %exitcond34, label %._crit_edge15, label %._crit_edge5.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next36, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond45, label %._crit_edge17, label %._crit_edge5.lr.ph

._crit_edge17:                                    ; preds = %._crit_edge15
  %138 = add nuw nsw i32 %.0518, 1
  %exitcond39 = icmp eq i32 %138, 501
  br i1 %exitcond39, label %139, label %._crit_edge

; <label>:139:                                    ; preds = %._crit_edge17
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
._crit_edge.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge3.us.us.preheader

._crit_edge3.us.us.preheader:                     ; preds = %._crit_edge.lr.ph, %._crit_edge8.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge8.us ], [ 0, %._crit_edge.lr.ph ]
  %6 = mul nsw i64 %indvars.iv25, 120
  br label %._crit_edge3.us.us

._crit_edge8.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next26, 120
  br i1 %exitcond32, label %._crit_edge10, label %._crit_edge3.us.us.preheader

._crit_edge3.us.us:                               ; preds = %._crit_edge6.us.us, %._crit_edge3.us.us.preheader
  %indvars.iv21 = phi i64 [ 0, %._crit_edge3.us.us.preheader ], [ %indvars.iv.next22, %._crit_edge6.us.us ]
  %7 = add i64 %indvars.iv21, %6
  %8 = mul i64 %7, 120
  br label %9

._crit_edge6.us.us:                               ; preds = %._crit_edge4.us.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond, label %._crit_edge8.us, label %._crit_edge3.us.us

; <label>:9:                                      ; preds = %._crit_edge4.us.us, %._crit_edge3.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge4.us.us ], [ 0, %._crit_edge3.us.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge4.us.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge4.us.us

._crit_edge4.us.us:                               ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond30, label %._crit_edge6.us.us, label %9

._crit_edge10:                                    ; preds = %._crit_edge8.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
