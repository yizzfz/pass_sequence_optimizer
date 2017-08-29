; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader23.lr.ph, label %._crit_edge28

.preheader23.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count40 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count43 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.lr.ph, %._crit_edge26.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge26.us ], [ 0, %.preheader23.lr.ph ]
  %7 = trunc i64 %indvars.iv41 to i32
  %8 = add i32 %7, %0
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge28.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %9 = trunc i64 %indvars.iv38 to i32
  %10 = add i32 %8, %9
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, %5
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %13, double* %15, align 8
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
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %10, %16
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %20, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sub i32 %10, %23
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 1.000000e+01
  %27 = fdiv double %26, %5
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %27, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge28.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #2 {
  %5 = add nsw i32 %1, -1
  %6 = icmp sgt i32 %5, 1
  %7 = icmp sgt i32 %5, 1
  %wide.trip.count131 = zext i32 %5 to i64
  %wide.trip.count = zext i32 %5 to i64
  %wide.trip.count135 = zext i32 %5 to i64
  %8 = icmp sgt i32 %5, 1
  %wide.trip.count143 = zext i32 %5 to i64
  %wide.trip.count139 = zext i32 %5 to i64
  %wide.trip.count147 = zext i32 %5 to i64
  %9 = add nsw i64 %wide.trip.count139, -1
  %min.iters.check168 = icmp ult i64 %9, 2
  %n.vec171 = and i64 %9, -2
  %cmp.zero172 = icmp eq i64 %n.vec171, 0
  %ind.end195 = or i64 %9, 1
  %cmp.n196 = icmp eq i64 %9, %n.vec171
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %9, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %144, %._crit_edge127 ]
  br i1 %6, label %.preheader114.preheader, label %._crit_edge127

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader115:                                    ; preds = %._crit_edge119
  br i1 %8, label %.preheader.lr.ph.preheader, label %._crit_edge127

.preheader.lr.ph.preheader:                       ; preds = %.preheader115
  br label %.preheader.lr.ph

.preheader114:                                    ; preds = %.preheader114.preheader, %._crit_edge119
  %indvar174 = phi i64 [ %indvar.next175, %._crit_edge119 ], [ 0, %.preheader114.preheader ]
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge119 ], [ 1, %.preheader114.preheader ]
  %10 = add i64 %indvar174, 1
  %11 = add i64 %indvar174, 2
  br i1 %7, label %.preheader112.lr.ph, label %._crit_edge119

.preheader112.lr.ph:                              ; preds = %.preheader114
  %12 = add nuw nsw i64 %indvars.iv133, 1
  %13 = add nsw i64 %indvars.iv133, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader112.lr.ph
  %indvar176 = phi i64 [ %indvar.next177, %._crit_edge.us ], [ 0, %.preheader112.lr.ph ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge.us ], [ 1, %.preheader112.lr.ph ]
  %14 = add i64 %indvar176, 1
  %scevgep178 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 1
  %scevgep180 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 %wide.trip.count139
  %scevgep182 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar174, i64 %14, i64 1
  %scevgep184 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %14, i64 %wide.trip.count139
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %15 = add nsw i64 %indvars.iv129, -1
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
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv129, i64 %offset.idx197
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx197
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fmul <2 x double> %wide.load202, <double 2.000000e+00, double 2.000000e+00>
  %21 = fsub <2 x double> %wide.load201, %20
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %indvars.iv129, i64 %offset.idx197
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %wide.load203, %21
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %offset.idx197
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fsub <2 x double> %wide.load204, %20
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %15, i64 %offset.idx197
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %28, %wide.load205
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %25, %32
  %34 = add nuw nsw i64 %offset.idx197, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load206 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fsub <2 x double> %wide.load206, %20
  %38 = add nsw i64 %offset.idx197, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load207 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %37, %wide.load207
  %42 = fmul <2 x double> %41, <double 1.250000e-01, double 1.250000e-01>
  %43 = fadd <2 x double> %33, %42
  %44 = fadd <2 x double> %wide.load202, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx197
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8, !alias.scope !4, !noalias !1
  %index.next193 = add i64 %index192, 2
  %47 = icmp eq i64 %index.next193, %n.vec171
  br i1 %47, label %middle.block166, label %vector.body165, !llvm.loop !6

middle.block166:                                  ; preds = %vector.body165
  br i1 %cmp.n196, label %._crit_edge.us, label %scalar.ph167.preheader

scalar.ph167.preheader:                           ; preds = %middle.block166, %vector.memcheck190, %min.iters.checked169, %.preheader112.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck190 ], [ 1, %min.iters.checked169 ], [ 1, %.preheader112.us ], [ %ind.end195, %middle.block166 ]
  br label %scalar.ph167

scalar.ph167:                                     ; preds = %scalar.ph167.preheader, %scalar.ph167
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph167 ], [ %indvars.iv.ph, %scalar.ph167.preheader ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv129, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 2.000000e+00
  %53 = fsub double %49, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %indvars.iv129, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  %57 = fmul double %56, 1.250000e-01
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %52
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %15, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 1.250000e-01
  %65 = fadd double %57, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fsub double %67, %52
  %69 = add nsw i64 %indvars.iv, -1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %68, %71
  %73 = fmul double %72, 1.250000e-01
  %74 = fadd double %65, %73
  %75 = fadd double %51, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  store double %75, double* %76, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph167, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph167
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block166
  %exitcond132 = icmp eq i64 %indvars.iv.next130, %wide.trip.count131
  %indvar.next177 = add i64 %indvar176, 1
  br i1 %exitcond132, label %._crit_edge119.loopexit, label %.preheader112.us

._crit_edge119.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge119.loopexit, %.preheader114
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  %indvar.next175 = add i64 %indvar174, 1
  br i1 %exitcond136, label %.preheader115, label %.preheader114

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge125
  %indvar = phi i64 [ %indvar.next, %._crit_edge125 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge125 ], [ 1, %.preheader.lr.ph.preheader ]
  %77 = add i64 %indvar, 1
  %78 = add i64 %indvar, 2
  %79 = add nuw nsw i64 %indvars.iv145, 1
  %80 = add nsw i64 %indvars.iv145, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader.lr.ph
  %indvar150 = phi i64 [ %indvar.next151, %._crit_edge123.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge123.us ], [ 1, %.preheader.lr.ph ]
  %81 = add i64 %indvar150, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %81, i64 1
  %scevgep153 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %81, i64 %wide.trip.count139
  %scevgep155 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %81, i64 1
  %scevgep157 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %78, i64 %81, i64 %wide.trip.count139
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %82 = add nsw i64 %indvars.iv141, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

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
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %79, i64 %indvars.iv141, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fmul <2 x double> %wide.load159, <double 2.000000e+00, double 2.000000e+00>
  %88 = fsub <2 x double> %wide.load, %87
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %80, i64 %indvars.iv141, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %wide.load160, %88
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fsub <2 x double> %wide.load161, %87
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %82, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %95, %wide.load162
  %99 = fmul <2 x double> %98, <double 1.250000e-01, double 1.250000e-01>
  %100 = fadd <2 x double> %92, %99
  %101 = add nuw nsw i64 %offset.idx, 1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fsub <2 x double> %wide.load163, %87
  %105 = add nsw i64 %offset.idx, -1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fadd <2 x double> %104, %wide.load164
  %109 = fmul <2 x double> %108, <double 1.250000e-01, double 1.250000e-01>
  %110 = fadd <2 x double> %100, %109
  %111 = fadd <2 x double> %wide.load159, %110
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %114 = icmp eq i64 %index.next, %n.vec
  br i1 %114, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge123.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv137.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %scalar.ph ], [ %indvars.iv137.ph, %scalar.ph.preheader ]
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %79, i64 %indvars.iv141, i64 %indvars.iv137
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, 2.000000e+00
  %120 = fsub double %116, %119
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %80, i64 %indvars.iv141, i64 %indvars.iv137
  %122 = load double, double* %121, align 8
  %123 = fadd double %122, %120
  %124 = fmul double %123, 1.250000e-01
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %indvars.iv137
  %126 = load double, double* %125, align 8
  %127 = fsub double %126, %119
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %82, i64 %indvars.iv137
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  %131 = fmul double %130, 1.250000e-01
  %132 = fadd double %124, %131
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv.next138
  %134 = load double, double* %133, align 8
  %135 = fsub double %134, %119
  %136 = add nsw i64 %indvars.iv137, -1
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %136
  %138 = load double, double* %137, align 8
  %139 = fadd double %135, %138
  %140 = fmul double %139, 1.250000e-01
  %141 = fadd double %132, %140
  %142 = fadd double %118, %141
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  store double %142, double* %143, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %._crit_edge123.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge123.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %middle.block
  %exitcond144 = icmp eq i64 %indvars.iv.next142, %wide.trip.count143
  %indvar.next151 = add i64 %indvar150, 1
  br i1 %exitcond144, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, %wide.trip.count147
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond148, label %._crit_edge127.loopexit, label %.preheader.lr.ph

._crit_edge127.loopexit:                          ; preds = %._crit_edge125
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %._crit_edge127.loopexit, %.preheader116, %.preheader115
  %144 = add nuw nsw i32 %.0111128, 1
  %exitcond149 = icmp eq i32 %144, 501
  br i1 %exitcond149, label %145, label %.preheader116

; <label>:145:                                    ; preds = %._crit_edge127
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader20.lr.ph, label %._crit_edge25

.preheader20.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader20.lr.ph, %._crit_edge23.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge23.us ], [ 0, %.preheader20.lr.ph ]
  %9 = mul nsw i64 %indvars.iv39, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge25.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv35 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %22
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %._crit_edge23.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %22, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %22 ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %22

; <label>:22:                                     ; preds = %20, %15
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge25.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
