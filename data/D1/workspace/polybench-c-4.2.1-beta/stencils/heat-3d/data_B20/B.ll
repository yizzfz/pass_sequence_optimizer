; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %4, label %.preheader23.lr.ph, label %._crit_edge28

.preheader23.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count40 = zext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.lr.ph, %._crit_edge26.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge26.us ], [ 0, %.preheader23.lr.ph ]
  %9 = trunc i64 %indvars.iv41 to i32
  %10 = add i32 %9, %0
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count40
  br i1 %exitcond44, label %._crit_edge28.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv38 to i32
  %12 = add i32 %10, %11
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, %5
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %15, double* %17, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %6, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %18 = trunc i64 %indvars.iv to i32
  %19 = sub i32 %12, %18
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sub i32 %12, %23
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %27, <double 1.000000e+01, double 1.000000e+01>
  %29 = fdiv <2 x double> %28, %8
  %30 = bitcast double* %21 to <2 x double>*
  %31 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  store <2 x double> %29, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count40
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge28.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %6 = icmp sgt i32 %5, 1
  %wide.trip.count131 = zext i32 %5 to i64
  %7 = add nsw i64 %wide.trip.count131, -1
  %min.iters.check168 = icmp ult i64 %7, 2
  %n.vec171 = and i64 %7, -2
  %cmp.zero172 = icmp eq i64 %n.vec171, 0
  %ind.end195 = or i64 %7, 1
  %cmp.n196 = icmp eq i64 %7, %n.vec171
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %158, %._crit_edge127 ]
  br i1 %6, label %.preheader114.preheader, label %._crit_edge127

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader115:                                    ; preds = %._crit_edge119
  br i1 true, label %.preheader.lr.ph.preheader, label %.preheader115.._crit_edge127_crit_edge

.preheader115.._crit_edge127_crit_edge:           ; preds = %.preheader115
  br label %._crit_edge127

.preheader.lr.ph.preheader:                       ; preds = %.preheader115
  br label %.preheader.lr.ph

.preheader114:                                    ; preds = %.preheader114.preheader, %._crit_edge119
  %indvar174 = phi i64 [ %8, %._crit_edge119 ], [ 0, %.preheader114.preheader ]
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.pre-phi, %._crit_edge119 ], [ 1, %.preheader114.preheader ]
  %8 = add i64 %indvar174, 1
  %9 = add i64 %indvar174, 2
  br i1 true, label %.preheader112.lr.ph, label %.preheader114.._crit_edge119_crit_edge

.preheader114.._crit_edge119_crit_edge:           ; preds = %.preheader114
  %.pre = add nuw nsw i64 %indvars.iv133, 1
  br label %._crit_edge119

.preheader112.lr.ph:                              ; preds = %.preheader114
  %10 = add nuw nsw i64 %indvars.iv133, 1
  %11 = add nsw i64 %indvars.iv133, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader112.lr.ph
  %indvar176 = phi i64 [ %12, %._crit_edge.us ], [ 0, %.preheader112.lr.ph ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge.us ], [ 1, %.preheader112.lr.ph ]
  %12 = add i64 %indvar176, 1
  %scevgep178 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %8, i64 %12, i64 1
  %scevgep180 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %8, i64 %12, i64 %wide.trip.count131
  %scevgep182 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar174, i64 %12, i64 1
  %scevgep184 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %12, i64 %wide.trip.count131
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %13 = add nsw i64 %indvars.iv129, -1
  br i1 %min.iters.check168, label %scalar.ph167.preheader, label %min.iters.checked169

min.iters.checked169:                             ; preds = %.preheader112.us
  br i1 %cmp.zero172, label %scalar.ph167.preheader, label %vector.memcheck190

vector.memcheck190:                               ; preds = %min.iters.checked169
  %bound0186 = icmp ult double* %scevgep178, %scevgep184
  %bound1187 = icmp ult double* %scevgep182, %scevgep180
  %memcheck.conflict189 = and i1 %bound0186, %bound1187
  br i1 %memcheck.conflict189, label %scalar.ph167.preheader, label %vector.body165.preheader

vector.body165.preheader:                         ; preds = %vector.memcheck190
  br label %vector.body165

vector.body165:                                   ; preds = %vector.body165.preheader, %vector.body165
  %index192 = phi i64 [ %index.next193, %vector.body165 ], [ 0, %vector.body165.preheader ]
  %offset.idx197 = or i64 %index192, 1
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %10, i64 %indvars.iv129, i64 %offset.idx197
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx197
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fmul <2 x double> %wide.load202, <double 2.000000e+00, double 2.000000e+00>
  %19 = fsub <2 x double> %wide.load201, %18
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %indvars.iv129, i64 %offset.idx197
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load203, %19
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %offset.idx197
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load204, %18
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %13, i64 %offset.idx197
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %26, %wide.load205
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = fadd <2 x double> %23, %30
  %32 = add nuw nsw i64 %offset.idx197, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load206 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fsub <2 x double> %wide.load206, %18
  %36 = add nsw i64 %offset.idx197, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load207 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %35, %wide.load207
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %31, %40
  %42 = fadd <2 x double> %wide.load202, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx197
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next193 = add i64 %index192, 2
  %45 = icmp eq i64 %index.next193, %n.vec171
  br i1 %45, label %middle.block166, label %vector.body165, !llvm.loop !6

middle.block166:                                  ; preds = %vector.body165
  br i1 %cmp.n196, label %._crit_edge.us, label %scalar.ph167.preheader

scalar.ph167.preheader:                           ; preds = %middle.block166, %vector.memcheck190, %min.iters.checked169, %.preheader112.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck190 ], [ 1, %min.iters.checked169 ], [ 1, %.preheader112.us ], [ %ind.end195, %middle.block166 ]
  br label %scalar.ph167

scalar.ph167:                                     ; preds = %scalar.ph167.preheader, %scalar.ph167
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph167 ], [ %indvars.iv.ph, %scalar.ph167.preheader ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %10, i64 %indvars.iv129, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, 2.000000e+00
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %indvars.iv129, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = insertelement <2 x double> undef, double %50, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = insertelement <2 x double> undef, double %47, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = fsub <2 x double> %58, %56
  %60 = extractelement <2 x double> %59, i32 0
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %13, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = insertelement <2 x double> undef, double %60, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = insertelement <2 x double> undef, double %52, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> %59, <2 x i32> <i32 0, i32 3>
  %67 = fadd <2 x double> %66, %64
  %68 = fmul <2 x double> %67, <double 1.250000e-01, double 1.250000e-01>
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %71 = fadd double %69, %70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv.next
  %73 = load double, double* %72, align 8
  %74 = fsub double %73, %50
  %75 = add nsw i64 %indvars.iv, -1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fadd double %74, %77
  %79 = fmul double %78, 1.250000e-01
  %80 = fadd double %71, %79
  %81 = fadd double %49, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  store double %81, double* %82, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count131
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph167, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph167
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block166
  %exitcond132 = icmp eq i64 %indvars.iv.next130, %wide.trip.count131
  br i1 %exitcond132, label %._crit_edge119.loopexit, label %.preheader112.us

._crit_edge119.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge119

._crit_edge119:                                   ; preds = %.preheader114.._crit_edge119_crit_edge, %._crit_edge119.loopexit
  %indvars.iv.next134.pre-phi = phi i64 [ %.pre, %.preheader114.._crit_edge119_crit_edge ], [ %10, %._crit_edge119.loopexit ]
  %exitcond136 = icmp eq i64 %indvars.iv.next134.pre-phi, %wide.trip.count131
  br i1 %exitcond136, label %.preheader115, label %.preheader114

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge125
  %indvar = phi i64 [ %83, %._crit_edge125 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv145 = phi i64 [ %85, %._crit_edge125 ], [ 1, %.preheader.lr.ph.preheader ]
  %83 = add i64 %indvar, 1
  %84 = add i64 %indvar, 2
  %85 = add nuw nsw i64 %indvars.iv145, 1
  %86 = add nsw i64 %indvars.iv145, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader.lr.ph
  %indvar150 = phi i64 [ %87, %._crit_edge123.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge123.us ], [ 1, %.preheader.lr.ph ]
  %87 = add i64 %indvar150, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %87, i64 1
  %scevgep153 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %87, i64 %wide.trip.count131
  %scevgep155 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %87, i64 1
  %scevgep157 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %84, i64 %87, i64 %wide.trip.count131
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %88 = add nsw i64 %indvars.iv141, -1
  br i1 %min.iters.check168, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero172, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep157
  %bound1 = icmp ult double* %scevgep155, %scevgep153
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %85, i64 %indvars.iv141, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fmul <2 x double> %wide.load159, <double 2.000000e+00, double 2.000000e+00>
  %94 = fsub <2 x double> %wide.load, %93
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %86, i64 %indvars.iv141, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %wide.load160, %94
  %98 = fmul <2 x double> %97, <double 1.250000e-01, double 1.250000e-01>
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fsub <2 x double> %wide.load161, %93
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %88, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fadd <2 x double> %101, %wide.load162
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = fadd <2 x double> %98, %105
  %107 = add nuw nsw i64 %offset.idx, 1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fsub <2 x double> %wide.load163, %93
  %111 = add nsw i64 %offset.idx, -1
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %111
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !10
  %114 = fadd <2 x double> %110, %wide.load164
  %115 = fmul <2 x double> %114, <double 1.250000e-01, double 1.250000e-01>
  %116 = fadd <2 x double> %106, %115
  %117 = fadd <2 x double> %wide.load159, %116
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %119 = bitcast double* %118 to <2 x double>*
  store <2 x double> %117, <2 x double>* %119, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %120 = icmp eq i64 %index.next, %n.vec171
  br i1 %120, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n196, label %._crit_edge123.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv137.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end195, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %scalar.ph ], [ %indvars.iv137.ph, %scalar.ph.preheader ]
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %85, i64 %indvars.iv141, i64 %indvars.iv137
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, 2.000000e+00
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %86, i64 %indvars.iv141, i64 %indvars.iv137
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %indvars.iv137
  %129 = load double, double* %128, align 8
  %130 = insertelement <2 x double> undef, double %125, i32 0
  %131 = shufflevector <2 x double> %130, <2 x double> undef, <2 x i32> zeroinitializer
  %132 = insertelement <2 x double> undef, double %122, i32 0
  %133 = insertelement <2 x double> %132, double %129, i32 1
  %134 = fsub <2 x double> %133, %131
  %135 = extractelement <2 x double> %134, i32 0
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %88, i64 %indvars.iv137
  %137 = load double, double* %136, align 8
  %138 = insertelement <2 x double> undef, double %135, i32 0
  %139 = insertelement <2 x double> %138, double %137, i32 1
  %140 = insertelement <2 x double> undef, double %127, i32 0
  %141 = shufflevector <2 x double> %140, <2 x double> %134, <2 x i32> <i32 0, i32 3>
  %142 = fadd <2 x double> %141, %139
  %143 = fmul <2 x double> %142, <double 1.250000e-01, double 1.250000e-01>
  %144 = extractelement <2 x double> %143, i32 0
  %145 = extractelement <2 x double> %143, i32 1
  %146 = fadd double %144, %145
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv.next138
  %148 = load double, double* %147, align 8
  %149 = fsub double %148, %125
  %150 = add nsw i64 %indvars.iv137, -1
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %150
  %152 = load double, double* %151, align 8
  %153 = fadd double %149, %152
  %154 = fmul double %153, 1.250000e-01
  %155 = fadd double %146, %154
  %156 = fadd double %124, %155
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  store double %156, double* %157, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count131
  br i1 %exitcond140, label %._crit_edge123.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge123.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %middle.block
  %exitcond144 = icmp eq i64 %indvars.iv.next142, %wide.trip.count131
  br i1 %exitcond144, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %exitcond148 = icmp eq i64 %85, %wide.trip.count131
  br i1 %exitcond148, label %._crit_edge127.loopexit, label %.preheader.lr.ph

._crit_edge127.loopexit:                          ; preds = %._crit_edge125
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %.preheader115.._crit_edge127_crit_edge, %._crit_edge127.loopexit, %.preheader116
  %158 = add nuw nsw i32 %.0111128, 1
  %exitcond149 = icmp eq i32 %158, 501
  br i1 %exitcond149, label %159, label %.preheader116

; <label>:159:                                    ; preds = %._crit_edge127
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
  br i1 %7, label %.preheader20.lr.ph, label %._crit_edge26

.preheader20.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader20.lr.ph, %._crit_edge24.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge24.us ], [ 0, %.preheader20.lr.ph ]
  %9 = mul nsw i64 %indvars.iv41, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count
  br i1 %exitcond44, label %._crit_edge26.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge22.us.us, %.preheader.us.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next38, %._crit_edge22.us.us ]
  %11 = trunc i64 %indvars.iv37 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge22.us.us:                              ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count
  br i1 %exitcond40, label %._crit_edge24.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge.us.us

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %15, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge22.us.us, label %15

._crit_edge26.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
