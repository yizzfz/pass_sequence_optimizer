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
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge24

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %wide.trip.count = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge22.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge22.us ], [ 0, %.preheader19.lr.ph ]
  %8 = trunc i64 %indvars.iv37 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count36.pre-phi
  br i1 %exitcond40, label %._crit_edge24.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv34 to i32
  %11 = add i32 %9, %10
  br i1 %6, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 0
  store double %14, double* %16, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit.unr-lcssa
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit.unr-lcssa
  %wide.trip.count36.pre-phi = phi i64 [ 1, %.prol.loopexit.unr-lcssa ], [ %wide.trip.count, %._crit_edge.us.us.loopexit ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, %wide.trip.count36.pre-phi
  br i1 %exitcond, label %._crit_edge22.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count133 = zext i32 %4 to i64
  %5 = add nsw i64 %wide.trip.count133, -1
  %6 = icmp sgt i32 %4, 1
  %min.iters.check165 = icmp ult i64 %5, 2
  %n.vec168 = and i64 %5, -2
  %cmp.zero169 = icmp eq i64 %n.vec168, 0
  %ind.end192 = or i64 %5, 1
  %cmp.n193 = icmp eq i64 %5, %n.vec168
  %7 = icmp sgt i32 %4, 1
  %min.iters.check = icmp ult i64 %5, 2
  %n.vec = and i64 %5, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %5, 1
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %3
  %storemerge122 = phi i32 [ 1, %3 ], [ %142, %._crit_edge121 ]
  br i1 %6, label %.preheader106.lr.ph.preheader, label %._crit_edge121

.preheader106.lr.ph.preheader:                    ; preds = %.preheader110
  br label %.preheader106.lr.ph

.preheader109:                                    ; preds = %._crit_edge113
  br i1 %7, label %.preheader.lr.ph.preheader, label %._crit_edge121

.preheader.lr.ph.preheader:                       ; preds = %.preheader109
  br label %.preheader.lr.ph

.preheader106.lr.ph:                              ; preds = %.preheader106.lr.ph.preheader, %._crit_edge113
  %indvar171 = phi i64 [ %indvar.next172, %._crit_edge113 ], [ 0, %.preheader106.lr.ph.preheader ]
  %indvars.iv127 = phi i64 [ %10, %._crit_edge113 ], [ 1, %.preheader106.lr.ph.preheader ]
  %8 = add i64 %indvar171, 1
  %9 = add i64 %indvar171, 2
  %10 = add nuw nsw i64 %indvars.iv127, 1
  %11 = add nsw i64 %indvars.iv127, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.lr.ph
  %indvar173 = phi i64 [ %indvar.next174, %._crit_edge.us ], [ 0, %.preheader106.lr.ph ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge.us ], [ 1, %.preheader106.lr.ph ]
  %12 = add i64 %indvar173, 1
  %scevgep175 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %12, i64 1
  %scevgep177 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %12, i64 %wide.trip.count133
  %scevgep179 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar171, i64 %12, i64 1
  %scevgep181 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %12, i64 %wide.trip.count133
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %13 = add nsw i64 %indvars.iv123, -1
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
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv123, i64 %offset.idx194
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx194
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fmul <2 x double> %wide.load199, <double 2.000000e+00, double 2.000000e+00>
  %19 = fsub <2 x double> %wide.load198, %18
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv123, i64 %offset.idx194
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load200, %19
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %offset.idx194
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load201, %18
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %13, i64 %offset.idx194
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %26, %wide.load202
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = fadd <2 x double> %23, %30
  %32 = add nuw nsw i64 %offset.idx194, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fsub <2 x double> %wide.load203, %18
  %36 = add nsw i64 %offset.idx194, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %35, %wide.load204
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %31, %40
  %42 = fadd <2 x double> %wide.load199, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx194
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next190 = add i64 %index189, 2
  %45 = icmp eq i64 %index.next190, %n.vec168
  br i1 %45, label %middle.block163, label %vector.body162, !llvm.loop !6

middle.block163:                                  ; preds = %vector.body162
  br i1 %cmp.n193, label %._crit_edge.us, label %scalar.ph164.preheader

scalar.ph164.preheader:                           ; preds = %middle.block163, %vector.memcheck187, %min.iters.checked166, %.preheader106.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck187 ], [ 1, %min.iters.checked166 ], [ 1, %.preheader106.us ], [ %ind.end192, %middle.block163 ]
  br label %scalar.ph164

scalar.ph164:                                     ; preds = %scalar.ph164.preheader, %scalar.ph164
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph164 ], [ %indvars.iv.ph, %scalar.ph164.preheader ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv123, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, 2.000000e+00
  %51 = fsub double %47, %50
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv123, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  %55 = fmul double %54, 1.250000e-01
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %50
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %13, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = fmul double %61, 1.250000e-01
  %63 = fadd double %55, %62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = fsub double %65, %50
  %67 = add nsw i64 %indvars.iv, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fadd double %66, %69
  %71 = fmul double %70, 1.250000e-01
  %72 = fadd double %63, %71
  %73 = fadd double %49, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  store double %73, double* %74, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph164, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph164
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block163
  %indvars.iv.next.lcssa = phi i64 [ %ind.end192, %middle.block163 ], [ %indvars.iv.next, %._crit_edge.us.loopexit ]
  %exitcond126 = icmp eq i64 %indvars.iv.next124, %indvars.iv.next.lcssa
  %indvar.next174 = add i64 %indvar173, 1
  br i1 %exitcond126, label %._crit_edge113, label %.preheader106.us

._crit_edge113:                                   ; preds = %._crit_edge.us
  %exitcond130 = icmp eq i64 %10, %wide.trip.count
  %indvar.next172 = add i64 %indvar171, 1
  br i1 %exitcond130, label %.preheader109, label %.preheader106.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv139 = phi i64 [ %77, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %75 = add i64 %indvar, 1
  %76 = add i64 %indvar, 2
  %77 = add nuw nsw i64 %indvars.iv139, 1
  %78 = add nsw i64 %indvars.iv139, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvar147 = phi i64 [ %indvar.next148, %._crit_edge117.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge117.us ], [ 1, %.preheader.lr.ph ]
  %79 = add i64 %indvar147, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %79, i64 1
  %scevgep150 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %79, i64 %wide.trip.count133
  %scevgep152 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %79, i64 1
  %scevgep154 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %79, i64 %wide.trip.count133
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %80 = add nsw i64 %indvars.iv135, -1
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
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %indvars.iv135, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fmul <2 x double> %wide.load156, <double 2.000000e+00, double 2.000000e+00>
  %86 = fsub <2 x double> %wide.load, %85
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv135, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %wide.load157, %86
  %90 = fmul <2 x double> %89, <double 1.250000e-01, double 1.250000e-01>
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fsub <2 x double> %wide.load158, %85
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %80, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fadd <2 x double> %93, %wide.load159
  %97 = fmul <2 x double> %96, <double 1.250000e-01, double 1.250000e-01>
  %98 = fadd <2 x double> %90, %97
  %99 = add nuw nsw i64 %offset.idx, 1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %99
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fsub <2 x double> %wide.load160, %85
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = fadd <2 x double> %102, %wide.load161
  %107 = fmul <2 x double> %106, <double 1.250000e-01, double 1.250000e-01>
  %108 = fadd <2 x double> %98, %107
  %109 = fadd <2 x double> %wide.load156, %108
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %111 = bitcast double* %110 to <2 x double>*
  store <2 x double> %109, <2 x double>* %111, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %112 = icmp eq i64 %index.next, %n.vec
  br i1 %112, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv131.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %scalar.ph ], [ %indvars.iv131.ph, %scalar.ph.preheader ]
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %indvars.iv135, i64 %indvars.iv131
  %114 = load double, double* %113, align 8
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 2.000000e+00
  %118 = fsub double %114, %117
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv135, i64 %indvars.iv131
  %120 = load double, double* %119, align 8
  %121 = fadd double %120, %118
  %122 = fmul double %121, 1.250000e-01
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %indvars.iv131
  %124 = load double, double* %123, align 8
  %125 = fsub double %124, %117
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %80, i64 %indvars.iv131
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  %129 = fmul double %128, 1.250000e-01
  %130 = fadd double %122, %129
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv.next132
  %132 = load double, double* %131, align 8
  %133 = fsub double %132, %117
  %134 = add nsw i64 %indvars.iv131, -1
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %134
  %136 = load double, double* %135, align 8
  %137 = fadd double %133, %136
  %138 = fmul double %137, 1.250000e-01
  %139 = fadd double %130, %138
  %140 = fadd double %116, %139
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  store double %140, double* %141, align 8
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %wide.trip.count133
  br i1 %exitcond134, label %._crit_edge117.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %middle.block
  %exitcond138 = icmp eq i64 %indvars.iv.next136, %wide.trip.count133
  %indvar.next148 = add i64 %indvar147, 1
  br i1 %exitcond138, label %._crit_edge119, label %.preheader.us

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %exitcond142 = icmp eq i64 %77, %wide.trip.count133
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond142, label %._crit_edge121.loopexit, label %.preheader.lr.ph

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader110, %.preheader109
  %142 = add nuw nsw i32 %storemerge122, 1
  %exitcond143 = icmp eq i32 %142, 501
  br i1 %exitcond143, label %143, label %.preheader110

; <label>:143:                                    ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader15.lr.ph, label %._crit_edge20

.preheader15.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader15.lr.ph, %._crit_edge18.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge18.us ], [ 0, %.preheader15.lr.ph ]
  %9 = mul nsw i64 %indvars.iv34, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count
  br i1 %exitcond37, label %._crit_edge20.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv30 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %22
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %indvars.iv.next
  br i1 %exitcond33, label %._crit_edge18.us, label %.preheader.us.us

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
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge20.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
