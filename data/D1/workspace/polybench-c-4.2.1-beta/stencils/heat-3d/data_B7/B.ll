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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge24

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = zext i32 %0 to i64
  %xtraiter = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge22.us, %.preheader19.lr.ph
  %indvars.iv38 = phi i64 [ 0, %.preheader19.lr.ph ], [ %indvars.iv.next39, %._crit_edge22.us ]
  %8 = trunc i64 %indvars.iv38 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %6
  br i1 %exitcond41, label %._crit_edge24.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv34 to i32
  %11 = add i32 %9, %10
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.us.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv38, i64 %indvars.iv34, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv38, i64 %indvars.iv34, i64 0
  store double %14, double* %16, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.preheader.us.us, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.preheader.us.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new

.preheader.us.us.new:                             ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %6
  br i1 %exitcond37, label %._crit_edge22.us, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.us.new ], [ %indvars.iv.next.1, %._crit_edge ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv38, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next.1, %6
  br i1 %exitcond42.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %6 = icmp sgt i32 %5, 1
  %7 = zext i32 %5 to i64
  %8 = add nsw i64 %7, -1
  %min.iters.check167 = icmp ult i64 %8, 2
  %n.vec170 = and i64 %8, -2
  %cmp.zero171 = icmp eq i64 %n.vec170, 0
  %ind.end194 = or i64 %8, 1
  %cmp.n195 = icmp eq i64 %8, %n.vec170
  %n.vec = and i64 %8, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %8, 1
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %143, %._crit_edge121 ]
  br i1 %6, label %.preheader106.lr.ph.preheader, label %._crit_edge121

.preheader106.lr.ph.preheader:                    ; preds = %.preheader110
  br label %.preheader106.lr.ph

.preheader109:                                    ; preds = %._crit_edge113
  br i1 true, label %.preheader.lr.ph.preheader, label %.preheader109.._crit_edge121_crit_edge

.preheader109.._crit_edge121_crit_edge:           ; preds = %.preheader109
  br label %._crit_edge121

.preheader.lr.ph.preheader:                       ; preds = %.preheader109
  br label %.preheader.lr.ph

.preheader106.lr.ph:                              ; preds = %.preheader106.lr.ph.preheader, %._crit_edge113
  %indvar173 = phi i64 [ %9, %._crit_edge113 ], [ 0, %.preheader106.lr.ph.preheader ]
  %indvars.iv127 = phi i64 [ %11, %._crit_edge113 ], [ 1, %.preheader106.lr.ph.preheader ]
  %9 = add i64 %indvar173, 1
  %10 = add i64 %indvar173, 2
  %11 = add nuw nsw i64 %indvars.iv127, 1
  %12 = add nsw i64 %indvars.iv127, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.lr.ph
  %indvar175 = phi i64 [ %13, %._crit_edge.us ], [ 0, %.preheader106.lr.ph ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge.us ], [ 1, %.preheader106.lr.ph ]
  %13 = add i64 %indvar175, 1
  %scevgep177 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %9, i64 %13, i64 1
  %scevgep179 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %9, i64 %13, i64 %7
  %scevgep181 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar173, i64 %13, i64 1
  %scevgep183 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %10, i64 %13, i64 %7
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %14 = add nsw i64 %indvars.iv123, -1
  br i1 %min.iters.check167, label %._crit_edge.preheader, label %min.iters.checked168

min.iters.checked168:                             ; preds = %.preheader106.us
  br i1 %cmp.zero171, label %._crit_edge.preheader, label %vector.memcheck189

vector.memcheck189:                               ; preds = %min.iters.checked168
  %bound0185 = icmp ult double* %scevgep177, %scevgep183
  %bound1186 = icmp ult double* %scevgep181, %scevgep179
  %memcheck.conflict188 = and i1 %bound0185, %bound1186
  br i1 %memcheck.conflict188, label %._crit_edge.preheader, label %vector.body164.preheader

vector.body164.preheader:                         ; preds = %vector.memcheck189
  br label %vector.body164

vector.body164:                                   ; preds = %vector.body164.preheader, %vector.body164
  %index191 = phi i64 [ %index.next192, %vector.body164 ], [ 0, %vector.body164.preheader ]
  %offset.idx196 = or i64 %index191, 1
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %indvars.iv123, i64 %offset.idx196
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx196
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fmul <2 x double> %wide.load201, <double 2.000000e+00, double 2.000000e+00>
  %20 = fsub <2 x double> %wide.load200, %19
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv123, i64 %offset.idx196
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %wide.load202, %20
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %offset.idx196
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load203, %19
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %14, i64 %offset.idx196
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %27, %wide.load204
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %24, %31
  %33 = add nuw nsw i64 %offset.idx196, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fsub <2 x double> %wide.load205, %19
  %37 = add nsw i64 %offset.idx196, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load206 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fadd <2 x double> %36, %wide.load206
  %41 = fmul <2 x double> %40, <double 1.250000e-01, double 1.250000e-01>
  %42 = fadd <2 x double> %32, %41
  %43 = fadd <2 x double> %wide.load201, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx196
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !4, !noalias !1
  %index.next192 = add i64 %index191, 2
  %46 = icmp eq i64 %index.next192, %n.vec170
  br i1 %46, label %middle.block165, label %vector.body164, !llvm.loop !6

middle.block165:                                  ; preds = %vector.body164
  br i1 %cmp.n195, label %._crit_edge.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block165, %vector.memcheck189, %min.iters.checked168, %.preheader106.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck189 ], [ 1, %min.iters.checked168 ], [ 1, %.preheader106.us ], [ %ind.end194, %middle.block165 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %indvars.iv123, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 2.000000e+00
  %52 = fsub double %48, %51
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv123, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  %56 = fmul double %55, 1.250000e-01
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %51
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %14, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = fmul double %62, 1.250000e-01
  %64 = fadd double %56, %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %51
  %68 = add nsw i64 %indvars.iv, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %67, %70
  %72 = fmul double %71, 1.250000e-01
  %73 = fadd double %64, %72
  %74 = fadd double %50, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  store double %74, double* %75, align 8
  %exitcond147 = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond147, label %._crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block165
  %exitcond126 = icmp eq i64 %indvars.iv.next124, %7
  br i1 %exitcond126, label %._crit_edge113, label %.preheader106.us

._crit_edge113:                                   ; preds = %._crit_edge.us
  %exitcond130 = icmp eq i64 %11, %7
  br i1 %exitcond130, label %.preheader109, label %.preheader106.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvar = phi i64 [ %76, %._crit_edge119 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv139 = phi i64 [ %78, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %76 = add i64 %indvar, 1
  %77 = add i64 %indvar, 2
  %78 = add nuw nsw i64 %indvars.iv139, 1
  %79 = add nsw i64 %indvars.iv139, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvar149 = phi i64 [ %80, %._crit_edge117.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge117.us ], [ 1, %.preheader.lr.ph ]
  %80 = add i64 %indvar149, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %80, i64 1
  %scevgep152 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %80, i64 %7
  %scevgep154 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %80, i64 1
  %scevgep156 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %77, i64 %80, i64 %7
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %81 = add nsw i64 %indvars.iv135, -1
  br i1 %min.iters.check167, label %._crit_edge148.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %._crit_edge148.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep156
  %bound1 = icmp ult double* %scevgep154, %scevgep152
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge148.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %78, i64 %indvars.iv135, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fmul <2 x double> %wide.load158, <double 2.000000e+00, double 2.000000e+00>
  %87 = fsub <2 x double> %wide.load, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %79, i64 %indvars.iv135, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %wide.load159, %87
  %91 = fmul <2 x double> %90, <double 1.250000e-01, double 1.250000e-01>
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fsub <2 x double> %wide.load160, %86
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %81, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %94, %wide.load161
  %98 = fmul <2 x double> %97, <double 1.250000e-01, double 1.250000e-01>
  %99 = fadd <2 x double> %91, %98
  %100 = add nuw nsw i64 %offset.idx, 1
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %100
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fsub <2 x double> %wide.load162, %86
  %104 = add nsw i64 %offset.idx, -1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fadd <2 x double> %103, %wide.load163
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = fadd <2 x double> %99, %108
  %110 = fadd <2 x double> %wide.load158, %109
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %112 = bitcast double* %111 to <2 x double>*
  store <2 x double> %110, <2 x double>* %112, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %113 = icmp eq i64 %index.next, %n.vec
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117.us, label %._crit_edge148.preheader

._crit_edge148.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv131.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %._crit_edge148

._crit_edge148:                                   ; preds = %._crit_edge148.preheader, %._crit_edge148
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge148 ], [ %indvars.iv131.ph, %._crit_edge148.preheader ]
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %78, i64 %indvars.iv135, i64 %indvars.iv131
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, 2.000000e+00
  %119 = fsub double %115, %118
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %79, i64 %indvars.iv135, i64 %indvars.iv131
  %121 = load double, double* %120, align 8
  %122 = fadd double %121, %119
  %123 = fmul double %122, 1.250000e-01
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %indvars.iv131
  %125 = load double, double* %124, align 8
  %126 = fsub double %125, %118
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %81, i64 %indvars.iv131
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  %130 = fmul double %129, 1.250000e-01
  %131 = fadd double %123, %130
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv.next132
  %133 = load double, double* %132, align 8
  %134 = fsub double %133, %118
  %135 = add nsw i64 %indvars.iv131, -1
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv139, i64 %indvars.iv135, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %134, %137
  %139 = fmul double %138, 1.250000e-01
  %140 = fadd double %131, %139
  %141 = fadd double %117, %140
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  store double %141, double* %142, align 8
  %exitcond = icmp eq i64 %indvars.iv.next132, %7
  br i1 %exitcond, label %._crit_edge117.us.loopexit, label %._crit_edge148, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %._crit_edge148
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %middle.block
  %exitcond138 = icmp eq i64 %indvars.iv.next136, %7
  br i1 %exitcond138, label %._crit_edge119, label %.preheader.us

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %exitcond142 = icmp eq i64 %78, %7
  br i1 %exitcond142, label %._crit_edge121.loopexit, label %.preheader.lr.ph

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %.preheader109.._crit_edge121_crit_edge, %._crit_edge121.loopexit, %.preheader110
  %143 = add nuw nsw i32 %storemerge122, 1
  %exitcond143 = icmp eq i32 %143, 501
  br i1 %exitcond143, label %144, label %.preheader110

; <label>:144:                                    ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader15.lr.ph, label %._crit_edge20

.preheader15.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge18.us, %.preheader15.lr.ph
  %indvars.iv34 = phi i64 [ 0, %.preheader15.lr.ph ], [ %indvars.iv.next35, %._crit_edge18.us ]
  %10 = mul nsw i64 %indvars.iv34, %8
  %11 = trunc i64 %10 to i32
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %9
  br i1 %exitcond37, label %._crit_edge20.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us.us ]
  %12 = trunc i64 %indvars.iv30 to i32
  %13 = add i32 %12, %11
  %14 = mul i32 %13, %0
  %15 = zext i32 %14 to i64
  br label %._crit_edge39

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %9
  br i1 %exitcond33, label %._crit_edge18.us, label %.preheader.us.us

._crit_edge39:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %16 = add i64 %indvars.iv, %15
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %._crit_edge39
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge39, %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond38, label %._crit_edge.us.us, label %._crit_edge39

._crit_edge20.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
