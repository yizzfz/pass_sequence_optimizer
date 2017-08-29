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
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge24

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = zext i32 %0 to i64
  %7 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %wide.trip.count.1 = zext i32 %0 to i64
  %8 = icmp eq i32 %xtraiter, 0
  %9 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge22.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge22.us ], [ 0, %.preheader19.lr.ph ]
  %10 = trunc i64 %indvars.iv37 to i32
  %11 = add i32 %10, %0
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %7
  br i1 %exitcond, label %._crit_edge24.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us.us ]
  %12 = trunc i64 %indvars.iv34 to i32
  %13 = add i32 %11, %12
  br i1 %8, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %14 = sitofp i32 %13 to double
  %15 = fmul double %14, 1.000000e+01
  %16 = fdiv double %15, %5
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 0
  store double %16, double* %17, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 0
  store double %16, double* %18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %9, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next35, %6
  br i1 %exitcond41, label %._crit_edge22.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = sub i32 %13, %19
  %21 = sitofp i32 %20 to double
  %22 = fmul double %21, 1.000000e+01
  %23 = fdiv double %22, %5
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv
  store double %23, double* %24, align 8
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv
  store double %23, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = trunc i64 %indvars.iv.next to i32
  %27 = sub i32 %13, %26
  %28 = sitofp i32 %27 to double
  %29 = fmul double %28, 1.000000e+01
  %30 = fdiv double %29, %5
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %30, double* %31, align 8
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %30, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %5 = add nsw i32 %1, -1
  %6 = zext i32 %5 to i64
  %7 = zext i32 %5 to i64
  %8 = zext i32 %5 to i64
  %9 = zext i32 %5 to i64
  %wide.trip.count125 = zext i32 %5 to i64
  %wide.trip.count137 = zext i32 %5 to i64
  %10 = add nsw i64 %8, -1
  %11 = icmp sgt i32 %5, 1
  %12 = icmp sgt i32 %5, 1
  %min.iters.check165 = icmp ult i64 %10, 2
  %n.vec168 = and i64 %10, -2
  %cmp.zero169 = icmp eq i64 %n.vec168, 0
  %ind.end192 = or i64 %10, 1
  %cmp.n193 = icmp eq i64 %10, %n.vec168
  %13 = icmp sgt i32 %5, 1
  %min.iters.check = icmp ult i64 %10, 2
  %n.vec = and i64 %10, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %10, 1
  %cmp.n = icmp eq i64 %10, %n.vec
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %148, %._crit_edge121 ]
  br i1 %11, label %.preheader108.preheader, label %._crit_edge121

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109:                                    ; preds = %._crit_edge113
  br i1 %13, label %.preheader.lr.ph.preheader, label %._crit_edge121

.preheader.lr.ph.preheader:                       ; preds = %.preheader109
  br label %.preheader.lr.ph

.preheader108:                                    ; preds = %.preheader108.preheader, %._crit_edge113
  %indvar171 = phi i64 [ %indvar.next172, %._crit_edge113 ], [ 0, %.preheader108.preheader ]
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %._crit_edge113 ], [ 1, %.preheader108.preheader ]
  %14 = add i64 %indvar171, 1
  %15 = add i64 %indvar171, 2
  br i1 %12, label %.preheader106.lr.ph, label %._crit_edge113

.preheader106.lr.ph:                              ; preds = %.preheader108
  %16 = add nuw nsw i64 %indvars.iv127, 1
  %17 = add nsw i64 %indvars.iv127, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.lr.ph
  %indvar173 = phi i64 [ %indvar.next174, %._crit_edge.us ], [ 0, %.preheader106.lr.ph ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge.us ], [ 1, %.preheader106.lr.ph ]
  %18 = add i64 %indvar173, 1
  %scevgep175 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %14, i64 %18, i64 1
  %scevgep177 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %14, i64 %18, i64 %8
  %scevgep179 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar171, i64 %18, i64 1
  %scevgep181 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %15, i64 %18, i64 %8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %19 = add nsw i64 %indvars.iv123, -1
  br i1 %min.iters.check165, label %scalar.ph164.preheader, label %min.iters.checked166

min.iters.checked166:                             ; preds = %.preheader106.us
  br i1 %cmp.zero169, label %scalar.ph164.preheader, label %vector.memcheck187

vector.memcheck187:                               ; preds = %min.iters.checked166
  %bound0183 = icmp ult double* %scevgep175, %scevgep181
  %bound1184 = icmp ult double* %scevgep179, %scevgep177
  %memcheck.conflict186 = and i1 %bound0183, %bound1184
  br i1 %memcheck.conflict186, label %scalar.ph164.preheader, label %vector.body162.preheader

vector.body162.preheader:                         ; preds = %vector.memcheck187
  br label %vector.body162

vector.body162:                                   ; preds = %vector.body162.preheader, %vector.body162
  %index189 = phi i64 [ %index.next190, %vector.body162 ], [ 0, %vector.body162.preheader ]
  %offset.idx194 = or i64 %index189, 1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %16, i64 %indvars.iv123, i64 %offset.idx194
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx194
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fmul <2 x double> %wide.load199, <double 2.000000e+00, double 2.000000e+00>
  %25 = fsub <2 x double> %wide.load198, %24
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %17, i64 %indvars.iv123, i64 %offset.idx194
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load200, %25
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %offset.idx194
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fsub <2 x double> %wide.load201, %24
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %19, i64 %offset.idx194
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %32, %wide.load202
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %29, %36
  %38 = add nuw nsw i64 %offset.idx194, 1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fsub <2 x double> %wide.load203, %24
  %42 = add nsw i64 %offset.idx194, -1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fadd <2 x double> %41, %wide.load204
  %46 = fmul <2 x double> %45, <double 1.250000e-01, double 1.250000e-01>
  %47 = fadd <2 x double> %37, %46
  %48 = fadd <2 x double> %wide.load199, %47
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx194
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !4, !noalias !1
  %index.next190 = add i64 %index189, 2
  %51 = icmp eq i64 %index.next190, %n.vec168
  br i1 %51, label %middle.block163, label %vector.body162, !llvm.loop !6

middle.block163:                                  ; preds = %vector.body162
  br i1 %cmp.n193, label %._crit_edge.us, label %scalar.ph164.preheader

scalar.ph164.preheader:                           ; preds = %middle.block163, %vector.memcheck187, %min.iters.checked166, %.preheader106.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck187 ], [ 1, %min.iters.checked166 ], [ 1, %.preheader106.us ], [ %ind.end192, %middle.block163 ]
  br label %scalar.ph164

scalar.ph164:                                     ; preds = %scalar.ph164.preheader, %scalar.ph164
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph164 ], [ %indvars.iv.ph, %scalar.ph164.preheader ]
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %16, i64 %indvars.iv123, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, 2.000000e+00
  %57 = fsub double %53, %56
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %17, i64 %indvars.iv123, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  %61 = fmul double %60, 1.250000e-01
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fsub double %63, %56
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %19, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = fmul double %67, 1.250000e-01
  %69 = fadd double %61, %68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv.next
  %71 = load double, double* %70, align 8
  %72 = fsub double %71, %56
  %73 = add nsw i64 %indvars.iv, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %72, %75
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %69, %77
  %79 = fadd double %55, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  store double %79, double* %80, align 8
  %exitcond144 = icmp eq i64 %indvars.iv.next, %6
  br i1 %exitcond144, label %._crit_edge.us.loopexit, label %scalar.ph164, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph164
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block163
  %exitcond126 = icmp eq i64 %indvars.iv.next124, %wide.trip.count125
  %indvar.next174 = add i64 %indvar173, 1
  br i1 %exitcond126, label %._crit_edge113.loopexit, label %.preheader106.us

._crit_edge113.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.preheader108
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond = icmp eq i64 %indvars.iv.next128, %7
  %indvar.next172 = add i64 %indvar171, 1
  br i1 %exitcond, label %.preheader109, label %.preheader108

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %81 = add i64 %indvar, 1
  %82 = add i64 %indvar, 2
  %83 = add nuw nsw i64 %indvars.iv139, 1
  %84 = add nsw i64 %indvars.iv139, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvar147 = phi i64 [ %indvar.next148, %._crit_edge117.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge117.us ], [ 1, %.preheader.lr.ph ]
  %85 = add i64 %indvar147, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %81, i64 %85, i64 1
  %scevgep150 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %81, i64 %85, i64 %8
  %scevgep152 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %85, i64 1
  %scevgep154 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %82, i64 %85, i64 %8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %86 = add nsw i64 %indvars.iv135, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep154
  %bound1 = icmp ult double* %scevgep152, %scevgep150
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %83, i64 %indvars.iv135, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fmul <2 x double> %wide.load156, <double 2.000000e+00, double 2.000000e+00>
  %92 = fsub <2 x double> %wide.load, %91
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %84, i64 %indvars.iv135, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %wide.load157, %92
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fsub <2 x double> %wide.load158, %91
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %86, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %99, %wide.load159
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %96, %103
  %105 = add nuw nsw i64 %offset.idx, 1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fsub <2 x double> %wide.load160, %91
  %109 = add nsw i64 %offset.idx, -1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %109
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fadd <2 x double> %108, %wide.load161
  %113 = fmul <2 x double> %112, <double 1.250000e-01, double 1.250000e-01>
  %114 = fadd <2 x double> %104, %113
  %115 = fadd <2 x double> %wide.load156, %114
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  store <2 x double> %115, <2 x double>* %117, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %118 = icmp eq i64 %index.next, %n.vec
  br i1 %118, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv131.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %scalar.ph ], [ %indvars.iv131.ph, %scalar.ph.preheader ]
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %83, i64 %indvars.iv135, i64 %indvars.iv131
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, 2.000000e+00
  %124 = fsub double %120, %123
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %84, i64 %indvars.iv135, i64 %indvars.iv131
  %126 = load double, double* %125, align 8
  %127 = fadd double %126, %124
  %128 = fmul double %127, 1.250000e-01
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %indvars.iv131
  %130 = load double, double* %129, align 8
  %131 = fsub double %130, %123
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %86, i64 %indvars.iv131
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  %135 = fmul double %134, 1.250000e-01
  %136 = fadd double %128, %135
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv.next132
  %138 = load double, double* %137, align 8
  %139 = fsub double %138, %123
  %140 = add nsw i64 %indvars.iv131, -1
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %140
  %142 = load double, double* %141, align 8
  %143 = fadd double %139, %142
  %144 = fmul double %143, 1.250000e-01
  %145 = fadd double %136, %144
  %146 = fadd double %122, %145
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  store double %146, double* %147, align 8
  %exitcond145 = icmp eq i64 %indvars.iv.next132, %8
  br i1 %exitcond145, label %._crit_edge117.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %middle.block
  %exitcond138 = icmp eq i64 %indvars.iv.next136, %wide.trip.count137
  %indvar.next148 = add i64 %indvar147, 1
  br i1 %exitcond138, label %._crit_edge119, label %.preheader.us

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next140, %9
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond146, label %._crit_edge121.loopexit, label %.preheader.lr.ph

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader110, %.preheader109
  %148 = add nuw nsw i32 %storemerge122, 1
  %exitcond143 = icmp eq i32 %148, 501
  br i1 %exitcond143, label %149, label %.preheader110

; <label>:149:                                    ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader15.lr.ph, label %._crit_edge20

.preheader15.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  %11 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader15.lr.ph, %._crit_edge18.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge18.us ], [ 0, %.preheader15.lr.ph ]
  %12 = mul nsw i64 %indvars.iv34, %8
  %13 = trunc i64 %12 to i32
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %11
  br i1 %exitcond39, label %._crit_edge20.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us.us ]
  %14 = trunc i64 %indvars.iv30 to i32
  %15 = add i32 %14, %13
  %16 = mul i32 %15, %0
  %17 = zext i32 %16 to i64
  br label %18

._crit_edge.us.us:                                ; preds = %25
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %10
  br i1 %exitcond, label %._crit_edge18.us, label %.preheader.us.us

; <label>:18:                                     ; preds = %25, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %25 ], [ 0, %.preheader.us.us ]
  %19 = add i64 %indvars.iv, %17
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #4
  br label %25

; <label>:25:                                     ; preds = %23, %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond38, label %._crit_edge.us.us, label %18

._crit_edge20.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %2
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #4
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
