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
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #3
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge5.us.._crit_edge.us_crit_edge, %._crit_edge.lr.ph
  %3 = phi i32 [ 0, %._crit_edge.lr.ph ], [ %5, %._crit_edge5.us.._crit_edge.us_crit_edge ]
  %4 = sext i32 %3 to i64
  br label %._crit_edge3.us.us.new

._crit_edge5.us:                                  ; preds = %._crit_edge4.us.us
  %5 = add nsw i32 %3, 1
  %6 = icmp slt i32 %5, 120
  br i1 %6, label %._crit_edge5.us.._crit_edge.us_crit_edge, label %.loopexit

._crit_edge5.us.._crit_edge.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %._crit_edge.us

._crit_edge3.us.us.new:                           ; preds = %._crit_edge4.us.us.._crit_edge3.us.us.new_crit_edge, %._crit_edge.us
  %7 = phi i32 [ 0, %._crit_edge.us ], [ %11, %._crit_edge4.us.us.._crit_edge3.us.us.new_crit_edge ]
  %8 = add nuw i32 %7, %3
  %9 = add i32 %8, 120
  %10 = sext i32 %7 to i64
  br label %._crit_edge

._crit_edge4.us.us:                               ; preds = %._crit_edge
  %11 = add nsw i32 %7, 1
  %12 = icmp slt i32 %11, 120
  br i1 %12, label %._crit_edge4.us.us.._crit_edge3.us.us.new_crit_edge, label %._crit_edge5.us

._crit_edge4.us.us.._crit_edge3.us.us.new_crit_edge: ; preds = %._crit_edge4.us.us
  br label %._crit_edge3.us.us.new

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge3.us.us.new
  %indvars.iv = phi i64 [ 0, %._crit_edge3.us.us.new ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %9, %13
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %10, i64 %indvars.iv
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %10, i64 %indvars.iv
  store double %17, double* %19, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %20 = trunc i64 %indvars.iv.next to i32
  %21 = sub i32 %9, %20
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, 1.000000e+01
  %24 = fdiv double %23, 1.200000e+02
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %10, i64 %indvars.iv.next
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %10, i64 %indvars.iv.next
  store double %24, double* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge4.us.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.loopexit:                                        ; preds = %._crit_edge5.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %._crit_edge9.lr.ph.preheader

._crit_edge9.lr.ph.preheader:                     ; preds = %._crit_edge17.._crit_edge9.lr.ph.preheader_crit_edge, %3
  %4 = phi i32 [ 1, %3 ], [ %151, %._crit_edge17.._crit_edge9.lr.ph.preheader_crit_edge ]
  br label %._crit_edge9.lr.ph

._crit_edge9.lr.ph:                               ; preds = %._crit_edge13.._crit_edge9.lr.ph_crit_edge, %._crit_edge9.lr.ph.preheader
  %indvar22 = phi i64 [ %indvar.next23, %._crit_edge13.._crit_edge9.lr.ph_crit_edge ], [ 0, %._crit_edge9.lr.ph.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge13.._crit_edge9.lr.ph_crit_edge ], [ 1, %._crit_edge9.lr.ph.preheader ]
  %5 = add i64 %indvar22, 1
  %6 = add i64 %indvar22, 2
  %7 = add nuw nsw i64 %indvars.iv52, 1
  %8 = add nsw i64 %indvars.iv52, -1
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge12.us.._crit_edge9.us_crit_edge, %._crit_edge9.lr.ph
  %indvar24 = phi i64 [ %indvar.next25, %._crit_edge12.us.._crit_edge9.us_crit_edge ], [ 0, %._crit_edge9.lr.ph ]
  %9 = phi i32 [ %76, %._crit_edge12.us.._crit_edge9.us_crit_edge ], [ 1, %._crit_edge9.lr.ph ]
  %10 = add i64 %indvar24, 1
  %scevgep26 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %10, i64 1
  %scevgep28 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %10, i64 119
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar22, i64 %10, i64 1
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %10, i64 119
  %11 = sext i32 %9 to i64
  %12 = add nsw i64 %11, 1
  %13 = add nsw i64 %11, -1
  %bound034 = icmp ult double* %scevgep26, %scevgep32
  %bound135 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict37 = and i1 %bound034, %bound135
  br i1 %memcheck.conflict37, label %._crit_edge.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %._crit_edge9.us
  br label %vector.body17

._crit_edge.preheader:                            ; preds = %._crit_edge9.us
  br label %._crit_edge

vector.body17:                                    ; preds = %vector.body17.vector.body17_crit_edge, %vector.body17.preheader
  %index40 = phi i64 [ %index.next41, %vector.body17.vector.body17_crit_edge ], [ 0, %vector.body17.preheader ]
  %offset.idx44 = or i64 %index40, 1
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %11, i64 %offset.idx44
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %11, i64 %offset.idx44
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fmul <2 x double> %wide.load49, <double 2.000000e+00, double 2.000000e+00>
  %19 = fsub <2 x double> %wide.load48, %18
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %11, i64 %offset.idx44
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %19, %wide.load50
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %12, i64 %offset.idx44
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load51, %18
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %13, i64 %offset.idx44
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %26, %wide.load52
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = fadd <2 x double> %23, %30
  %32 = add nuw nsw i64 %offset.idx44, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %11, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fsub <2 x double> %wide.load53, %18
  %36 = add nsw i64 %offset.idx44, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %11, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %35, %wide.load54
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %31, %40
  %42 = fadd <2 x double> %41, %wide.load49
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv52, i64 %11, i64 %offset.idx44
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next41 = add i64 %index40, 2
  %45 = icmp eq i64 %index.next41, 118
  br i1 %45, label %._crit_edge12.us.loopexit56, label %vector.body17.vector.body17_crit_edge, !llvm.loop !6

vector.body17.vector.body17_crit_edge:            ; preds = %vector.body17
  br label %vector.body17

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.._crit_edge_crit_edge ], [ 1, %._crit_edge.preheader ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %11, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %11, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, 2.000000e+00
  %51 = fsub double %47, %50
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %11, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = fmul double %54, 1.250000e-01
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %12, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %50
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %13, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = fmul double %61, 1.250000e-01
  %63 = fadd double %55, %62
  %64 = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %11, i64 %64
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %50
  %68 = add nsw i64 %indvars.iv, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv52, i64 %11, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %67, %70
  %72 = fmul double %71, 1.250000e-01
  %73 = fadd double %63, %72
  %74 = fadd double %73, %49
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv52, i64 %11, i64 %indvars.iv
  store double %74, double* %75, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge12.us.loopexit, label %._crit_edge.._crit_edge_crit_edge, !llvm.loop !9

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge12.us

._crit_edge12.us.loopexit56:                      ; preds = %vector.body17
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit56, %._crit_edge12.us.loopexit
  %76 = add nsw i32 %9, 1
  %77 = icmp slt i32 %76, 119
  %indvar.next25 = add i64 %indvar24, 1
  br i1 %77, label %._crit_edge12.us.._crit_edge9.us_crit_edge, label %._crit_edge13

._crit_edge12.us.._crit_edge9.us_crit_edge:       ; preds = %._crit_edge12.us
  br label %._crit_edge9.us

._crit_edge13:                                    ; preds = %._crit_edge12.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 119
  %indvar.next23 = add i64 %indvar22, 1
  br i1 %exitcond55, label %._crit_edge11.lr.ph.preheader, label %._crit_edge13.._crit_edge9.lr.ph_crit_edge

._crit_edge13.._crit_edge9.lr.ph_crit_edge:       ; preds = %._crit_edge13
  br label %._crit_edge9.lr.ph

._crit_edge11.lr.ph.preheader:                    ; preds = %._crit_edge13
  br label %._crit_edge11.lr.ph

._crit_edge11.lr.ph:                              ; preds = %._crit_edge16.._crit_edge11.lr.ph_crit_edge, %._crit_edge11.lr.ph.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge16.._crit_edge11.lr.ph_crit_edge ], [ 0, %._crit_edge11.lr.ph.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge16.._crit_edge11.lr.ph_crit_edge ], [ 1, %._crit_edge11.lr.ph.preheader ]
  %78 = add i64 %indvar, 1
  %79 = add i64 %indvar, 2
  %80 = add nuw nsw i64 %indvars.iv60, 1
  %81 = add nsw i64 %indvars.iv60, -1
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge15.us.._crit_edge11.us_crit_edge, %._crit_edge11.lr.ph
  %indvar2 = phi i64 [ %indvar.next3, %._crit_edge15.us.._crit_edge11.us_crit_edge ], [ 0, %._crit_edge11.lr.ph ]
  %82 = phi i32 [ %149, %._crit_edge15.us.._crit_edge11.us_crit_edge ], [ 1, %._crit_edge11.lr.ph ]
  %83 = add i64 %indvar2, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %78, i64 %83, i64 1
  %scevgep5 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %78, i64 %83, i64 119
  %scevgep7 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %83, i64 1
  %scevgep9 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %83, i64 119
  %84 = sext i32 %82 to i64
  %85 = add nsw i64 %84, 1
  %86 = add nsw i64 %84, -1
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge1.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge11.us
  br label %vector.body

._crit_edge1.preheader:                           ; preds = %._crit_edge11.us
  br label %._crit_edge1

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %80, i64 %84, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %84, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fmul <2 x double> %wide.load11, <double 2.000000e+00, double 2.000000e+00>
  %92 = fsub <2 x double> %wide.load, %91
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %81, i64 %84, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %92, %wide.load12
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %85, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fsub <2 x double> %wide.load13, %91
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %86, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %99, %wide.load14
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %96, %103
  %105 = add nuw nsw i64 %offset.idx, 1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %84, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fsub <2 x double> %wide.load15, %91
  %109 = add nsw i64 %offset.idx, -1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %84, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fadd <2 x double> %108, %wide.load16
  %113 = fmul <2 x double> %112, <double 1.250000e-01, double 1.250000e-01>
  %114 = fadd <2 x double> %104, %113
  %115 = fadd <2 x double> %114, %wide.load11
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv60, i64 %84, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  store <2 x double> %115, <2 x double>* %117, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %118 = icmp eq i64 %index.next, 118
  br i1 %118, label %._crit_edge15.us.loopexit55, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge1:                                     ; preds = %._crit_edge1.._crit_edge1_crit_edge, %._crit_edge1.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge1.._crit_edge1_crit_edge ], [ 1, %._crit_edge1.preheader ]
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %80, i64 %84, i64 %indvars.iv56
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %84, i64 %indvars.iv56
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 2.000000e+00
  %124 = fsub double %120, %123
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %81, i64 %84, i64 %indvars.iv56
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  %128 = fmul double %127, 1.250000e-01
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %85, i64 %indvars.iv56
  %130 = load double, double* %129, align 8
  %131 = fsub double %130, %123
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %86, i64 %indvars.iv56
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = fmul double %134, 1.250000e-01
  %136 = fadd double %128, %135
  %137 = add nuw nsw i64 %indvars.iv56, 1
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %84, i64 %137
  %139 = load double, double* %138, align 8
  %140 = fsub double %139, %123
  %141 = add nsw i64 %indvars.iv56, -1
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv60, i64 %84, i64 %141
  %143 = load double, double* %142, align 8
  %144 = fadd double %140, %143
  %145 = fmul double %144, 1.250000e-01
  %146 = fadd double %136, %145
  %147 = fadd double %146, %122
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv60, i64 %84, i64 %indvars.iv56
  store double %147, double* %148, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, 119
  br i1 %exitcond59, label %._crit_edge15.us.loopexit, label %._crit_edge1.._crit_edge1_crit_edge, !llvm.loop !16

._crit_edge1.._crit_edge1_crit_edge:              ; preds = %._crit_edge1
  br label %._crit_edge1

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge1
  br label %._crit_edge15.us

._crit_edge15.us.loopexit55:                      ; preds = %vector.body
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit55, %._crit_edge15.us.loopexit
  %149 = add nsw i32 %82, 1
  %150 = icmp slt i32 %149, 119
  %indvar.next3 = add i64 %indvar2, 1
  br i1 %150, label %._crit_edge15.us.._crit_edge11.us_crit_edge, label %._crit_edge16

._crit_edge15.us.._crit_edge11.us_crit_edge:      ; preds = %._crit_edge15.us
  br label %._crit_edge11.us

._crit_edge16:                                    ; preds = %._crit_edge15.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond63, label %._crit_edge17, label %._crit_edge16.._crit_edge11.lr.ph_crit_edge

._crit_edge16.._crit_edge11.lr.ph_crit_edge:      ; preds = %._crit_edge16
  br label %._crit_edge11.lr.ph

._crit_edge17:                                    ; preds = %._crit_edge16
  %151 = add nuw nsw i32 %4, 1
  %exitcond64 = icmp eq i32 %151, 501
  br i1 %exitcond64, label %152, label %._crit_edge17.._crit_edge9.lr.ph.preheader_crit_edge

._crit_edge17.._crit_edge9.lr.ph.preheader_crit_edge: ; preds = %._crit_edge17
  br label %._crit_edge9.lr.ph.preheader

; <label>:152:                                    ; preds = %._crit_edge17
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
._crit_edge.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge6.us.._crit_edge.us_crit_edge, %._crit_edge.lr.ph
  %6 = phi i32 [ 0, %._crit_edge.lr.ph ], [ %9, %._crit_edge6.us.._crit_edge.us_crit_edge ]
  %7 = mul nsw i32 %6, 120
  %8 = sext i32 %6 to i64
  br label %._crit_edge3.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %9 = add nsw i32 %6, 1
  %10 = icmp slt i32 %9, 120
  br i1 %10, label %._crit_edge6.us.._crit_edge.us_crit_edge, label %.loopexit

._crit_edge6.us.._crit_edge.us_crit_edge:         ; preds = %._crit_edge6.us
  br label %._crit_edge.us

._crit_edge3.us.us:                               ; preds = %._crit_edge5.us.us.._crit_edge3.us.us_crit_edge, %._crit_edge.us
  %11 = phi i32 [ 0, %._crit_edge.us ], [ %16, %._crit_edge5.us.us.._crit_edge3.us.us_crit_edge ]
  %12 = add i32 %7, %11
  %13 = mul i32 %12, 120
  %14 = sext i32 %11 to i64
  %15 = zext i32 %13 to i64
  br label %._crit_edge4.us.us._crit_edge

._crit_edge5.us.us:                               ; preds = %._crit_edge4.us.us
  %16 = add nsw i32 %11, 1
  %17 = icmp slt i32 %16, 120
  br i1 %17, label %._crit_edge5.us.us.._crit_edge3.us.us_crit_edge, label %._crit_edge6.us

._crit_edge5.us.us.._crit_edge3.us.us_crit_edge:  ; preds = %._crit_edge5.us.us
  br label %._crit_edge3.us.us

._crit_edge4.us.us._crit_edge:                    ; preds = %._crit_edge4.us.us.._crit_edge4.us.us._crit_edge_crit_edge, %._crit_edge3.us.us
  %indvars.iv = phi i64 [ 0, %._crit_edge3.us.us ], [ %indvars.iv.next, %._crit_edge4.us.us.._crit_edge4.us.us._crit_edge_crit_edge ]
  %18 = add i64 %15, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %._crit_edge4.us.us._crit_edge.._crit_edge4.us.us_crit_edge

._crit_edge4.us.us._crit_edge.._crit_edge4.us.us_crit_edge: ; preds = %._crit_edge4.us.us._crit_edge
  br label %._crit_edge4.us.us

; <label>:22:                                     ; preds = %._crit_edge4.us.us._crit_edge
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %23) #4
  br label %._crit_edge4.us.us

._crit_edge4.us.us:                               ; preds = %._crit_edge4.us.us._crit_edge.._crit_edge4.us.us_crit_edge, %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %14, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge5.us.us, label %._crit_edge4.us.us.._crit_edge4.us.us._crit_edge_crit_edge

._crit_edge4.us.us.._crit_edge4.us.us._crit_edge_crit_edge: ; preds = %._crit_edge4.us.us
  br label %._crit_edge4.us.us._crit_edge

.loopexit:                                        ; preds = %._crit_edge6.us
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %30) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
