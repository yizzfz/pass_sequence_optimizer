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
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %._crit_edge.lr.ph, label %._crit_edge25

._crit_edge.lr.ph:                                ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = zext i32 %0 to i64
  %7 = zext i32 %0 to i64
  %8 = and i32 %0, 1
  %wide.trip.count.1 = zext i32 %0 to i64
  %9 = icmp eq i32 %8, 0
  %10 = icmp eq i32 %0, 1
  br label %._crit_edge19.us.us.preheader

._crit_edge19.us.us.preheader:                    ; preds = %._crit_edge23.us, %._crit_edge.lr.ph
  %indvars.iv39 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next40, %._crit_edge23.us ]
  %11 = trunc i64 %indvars.iv39 to i32
  %12 = add i32 %11, %0
  br label %._crit_edge19.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge21.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next40, %7
  br i1 %exitcond43, label %._crit_edge25.loopexit, label %._crit_edge19.us.us.preheader

._crit_edge19.us.us:                              ; preds = %._crit_edge21.us.us, %._crit_edge19.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %._crit_edge19.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge21.us.us ]
  %13 = trunc i64 %indvars.iv35 to i32
  %14 = add i32 %12, %13
  br i1 %9, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %._crit_edge19.us.us
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, %5
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 0
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 0
  store double %17, double* %19, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge19.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %._crit_edge19.us.us ]
  br i1 %10, label %._crit_edge21.us.us, label %._crit_edge19.us.us.new.preheader

._crit_edge19.us.us.new.preheader:                ; preds = %.prol.loopexit
  br label %._crit_edge19.us.us.new

._crit_edge21.us.us.loopexit:                     ; preds = %._crit_edge19.us.us.new
  br label %._crit_edge21.us.us

._crit_edge21.us.us:                              ; preds = %._crit_edge21.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, %6
  br i1 %exitcond, label %._crit_edge23.us, label %._crit_edge19.us.us

._crit_edge19.us.us.new:                          ; preds = %._crit_edge19.us.us.new.preheader, %._crit_edge19.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge19.us.us.new ], [ %indvars.iv.unr.ph, %._crit_edge19.us.us.new.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = sub i32 %14, %20
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, 1.000000e+01
  %24 = fdiv double %23, %5
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  store double %24, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = trunc i64 %indvars.iv.next to i32
  %28 = sub i32 %14, %27
  %29 = sitofp i32 %28 to double
  %30 = fmul double %29, 1.000000e+01
  %31 = fdiv double %30, %5
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next
  store double %31, double* %33, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge21.us.us.loopexit, label %._crit_edge19.us.us.new

._crit_edge25.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %6 = zext i32 %5 to i64
  %7 = zext i32 %5 to i64
  %wide.trip.count126 = zext i32 %5 to i64
  %wide.trip.count138 = zext i32 %5 to i64
  %8 = add nsw i64 %7, -1
  %9 = icmp sgt i32 %5, 1
  %10 = icmp sgt i32 %5, 1
  %min.iters.check168 = icmp ult i64 %8, 2
  %n.vec171 = and i64 %8, -2
  %cmp.zero172 = icmp eq i64 %n.vec171, 0
  %ind.end195 = or i64 %8, 1
  %cmp.n196 = icmp eq i64 %8, %n.vec171
  %11 = icmp sgt i32 %5, 1
  %min.iters.check = icmp ult i64 %8, 2
  %n.vec = and i64 %8, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %8, 1
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge122, %4
  %storemerge123 = phi i32 [ 1, %4 ], [ %146, %._crit_edge122 ]
  br i1 %9, label %._crit_edge106.preheader, label %._crit_edge122

._crit_edge106.preheader:                         ; preds = %._crit_edge
  br label %._crit_edge106

._crit_edge107:                                   ; preds = %._crit_edge114
  br i1 %11, label %._crit_edge110.lr.ph.preheader, label %._crit_edge122

._crit_edge110.lr.ph.preheader:                   ; preds = %._crit_edge107
  br label %._crit_edge110.lr.ph

._crit_edge106:                                   ; preds = %._crit_edge106.preheader, %._crit_edge114.._crit_edge106_crit_edge
  %indvar174 = phi i64 [ %indvar.next175, %._crit_edge114.._crit_edge106_crit_edge ], [ 0, %._crit_edge106.preheader ]
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %._crit_edge114.._crit_edge106_crit_edge ], [ 1, %._crit_edge106.preheader ]
  %12 = add i64 %indvar174, 1
  %13 = add i64 %indvar174, 2
  br i1 %10, label %._crit_edge108.lr.ph, label %._crit_edge114

._crit_edge108.lr.ph:                             ; preds = %._crit_edge106
  %14 = add nuw nsw i64 %indvars.iv128, 1
  %15 = add nsw i64 %indvars.iv128, -1
  br label %._crit_edge108.us

._crit_edge108.us:                                ; preds = %._crit_edge112.us.._crit_edge108.us_crit_edge, %._crit_edge108.lr.ph
  %indvar176 = phi i64 [ %indvar.next177, %._crit_edge112.us.._crit_edge108.us_crit_edge ], [ 0, %._crit_edge108.lr.ph ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge112.us.._crit_edge108.us_crit_edge ], [ 1, %._crit_edge108.lr.ph ]
  %16 = add i64 %indvar176, 1
  %scevgep178 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %12, i64 %16, i64 1
  %scevgep180 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %12, i64 %16, i64 %7
  %scevgep182 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar174, i64 %16, i64 1
  %scevgep184 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %16, i64 %7
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %17 = add nsw i64 %indvars.iv124, -1
  br i1 %min.iters.check168, label %._crit_edge145.preheader, label %min.iters.checked169

min.iters.checked169:                             ; preds = %._crit_edge108.us
  br i1 %cmp.zero172, label %._crit_edge145.preheader, label %vector.memcheck190

vector.memcheck190:                               ; preds = %min.iters.checked169
  %bound0186 = icmp ult double* %scevgep178, %scevgep184
  %bound1187 = icmp ult double* %scevgep182, %scevgep180
  %memcheck.conflict189 = and i1 %bound0186, %bound1187
  br i1 %memcheck.conflict189, label %._crit_edge145.preheader, label %vector.body165.preheader

vector.body165.preheader:                         ; preds = %vector.memcheck190
  br label %vector.body165

vector.body165:                                   ; preds = %vector.body165.preheader, %vector.body165
  %index192 = phi i64 [ %index.next193, %vector.body165 ], [ 0, %vector.body165.preheader ]
  %offset.idx197 = or i64 %index192, 1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %indvars.iv124, i64 %offset.idx197
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv124, i64 %offset.idx197
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fmul <2 x double> %wide.load202, <double 2.000000e+00, double 2.000000e+00>
  %23 = fsub <2 x double> %wide.load201, %22
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %15, i64 %indvars.iv124, i64 %offset.idx197
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %wide.load203, %23
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv.next125, i64 %offset.idx197
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fsub <2 x double> %wide.load204, %22
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %17, i64 %offset.idx197
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %30, %wide.load205
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %27, %34
  %36 = add nuw nsw i64 %offset.idx197, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv124, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load206 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fsub <2 x double> %wide.load206, %22
  %40 = add nsw i64 %offset.idx197, -1
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv124, i64 %40
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load207 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1
  %43 = fadd <2 x double> %39, %wide.load207
  %44 = fmul <2 x double> %43, <double 1.250000e-01, double 1.250000e-01>
  %45 = fadd <2 x double> %35, %44
  %46 = fadd <2 x double> %wide.load202, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv128, i64 %indvars.iv124, i64 %offset.idx197
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %46, <2 x double>* %48, align 8, !alias.scope !4, !noalias !1
  %index.next193 = add i64 %index192, 2
  %49 = icmp eq i64 %index.next193, %n.vec171
  br i1 %49, label %middle.block166, label %vector.body165, !llvm.loop !6

middle.block166:                                  ; preds = %vector.body165
  br i1 %cmp.n196, label %._crit_edge112.us, label %._crit_edge145.preheader

._crit_edge145.preheader:                         ; preds = %middle.block166, %vector.memcheck190, %min.iters.checked169, %._crit_edge108.us
  %indvars.iv.ph = phi i64 [ %ind.end195, %middle.block166 ], [ 1, %vector.memcheck190 ], [ 1, %min.iters.checked169 ], [ 1, %._crit_edge108.us ]
  br label %._crit_edge145

._crit_edge145:                                   ; preds = %._crit_edge145.preheader, %._crit_edge145
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge145 ], [ %indvars.iv.ph, %._crit_edge145.preheader ]
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %indvars.iv124, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv124, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, 2.000000e+00
  %55 = fsub double %51, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %15, i64 %indvars.iv124, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  %59 = fmul double %58, 1.250000e-01
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv.next125, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %17, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = fmul double %65, 1.250000e-01
  %67 = fadd double %59, %66
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv124, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fsub double %69, %54
  %71 = add nsw i64 %indvars.iv, -1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv128, i64 %indvars.iv124, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fadd double %70, %73
  %75 = fmul double %74, 1.250000e-01
  %76 = fadd double %67, %75
  %77 = fadd double %53, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv128, i64 %indvars.iv124, i64 %indvars.iv
  store double %77, double* %78, align 8
  %exitcond147 = icmp eq i64 %indvars.iv.next, %6
  br i1 %exitcond147, label %._crit_edge112.us.loopexit, label %._crit_edge145, !llvm.loop !9

._crit_edge112.us.loopexit:                       ; preds = %._crit_edge145
  br label %._crit_edge112.us

._crit_edge112.us:                                ; preds = %._crit_edge112.us.loopexit, %middle.block166
  %exitcond127 = icmp eq i64 %indvars.iv.next125, %wide.trip.count126
  br i1 %exitcond127, label %._crit_edge114.loopexit, label %._crit_edge112.us.._crit_edge108.us_crit_edge

._crit_edge112.us.._crit_edge108.us_crit_edge:    ; preds = %._crit_edge112.us
  %indvar.next177 = add i64 %indvar176, 1
  br label %._crit_edge108.us

._crit_edge114.loopexit:                          ; preds = %._crit_edge112.us
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit, %._crit_edge106
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond = icmp eq i64 %indvars.iv.next129, %7
  br i1 %exitcond, label %._crit_edge107, label %._crit_edge114.._crit_edge106_crit_edge

._crit_edge114.._crit_edge106_crit_edge:          ; preds = %._crit_edge114
  %indvar.next175 = add i64 %indvar174, 1
  br label %._crit_edge106

._crit_edge110.lr.ph:                             ; preds = %._crit_edge110.lr.ph.preheader, %._crit_edge120.._crit_edge110.lr.ph_crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge120.._crit_edge110.lr.ph_crit_edge ], [ 0, %._crit_edge110.lr.ph.preheader ]
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge120.._crit_edge110.lr.ph_crit_edge ], [ 1, %._crit_edge110.lr.ph.preheader ]
  %79 = add i64 %indvar, 1
  %80 = add i64 %indvar, 2
  %81 = add nuw nsw i64 %indvars.iv140, 1
  %82 = add nsw i64 %indvars.iv140, -1
  br label %._crit_edge110.us

._crit_edge110.us:                                ; preds = %._crit_edge118.us.._crit_edge110.us_crit_edge, %._crit_edge110.lr.ph
  %indvar150 = phi i64 [ %indvar.next151, %._crit_edge118.us.._crit_edge110.us_crit_edge ], [ 0, %._crit_edge110.lr.ph ]
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %._crit_edge118.us.._crit_edge110.us_crit_edge ], [ 1, %._crit_edge110.lr.ph ]
  %83 = add i64 %indvar150, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %83, i64 1
  %scevgep153 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %83, i64 %7
  %scevgep155 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %83, i64 1
  %scevgep157 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %80, i64 %83, i64 %7
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %84 = add nsw i64 %indvars.iv136, -1
  br i1 %min.iters.check, label %._crit_edge146.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge110.us
  br i1 %cmp.zero, label %._crit_edge146.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep157
  %bound1 = icmp ult double* %scevgep155, %scevgep153
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge146.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %81, i64 %indvars.iv136, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv136, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fmul <2 x double> %wide.load159, <double 2.000000e+00, double 2.000000e+00>
  %90 = fsub <2 x double> %wide.load, %89
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %82, i64 %indvars.iv136, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fadd <2 x double> %wide.load160, %90
  %94 = fmul <2 x double> %93, <double 1.250000e-01, double 1.250000e-01>
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv.next137, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fsub <2 x double> %wide.load161, %89
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %84, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fadd <2 x double> %97, %wide.load162
  %101 = fmul <2 x double> %100, <double 1.250000e-01, double 1.250000e-01>
  %102 = fadd <2 x double> %94, %101
  %103 = add nuw nsw i64 %offset.idx, 1
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv136, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = fsub <2 x double> %wide.load163, %89
  %107 = add nsw i64 %offset.idx, -1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv136, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fadd <2 x double> %106, %wide.load164
  %111 = fmul <2 x double> %110, <double 1.250000e-01, double 1.250000e-01>
  %112 = fadd <2 x double> %102, %111
  %113 = fadd <2 x double> %wide.load159, %112
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv140, i64 %indvars.iv136, i64 %offset.idx
  %115 = bitcast double* %114 to <2 x double>*
  store <2 x double> %113, <2 x double>* %115, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %116 = icmp eq i64 %index.next, %n.vec
  br i1 %116, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge118.us, label %._crit_edge146.preheader

._crit_edge146.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge110.us
  %indvars.iv132.ph = phi i64 [ %ind.end, %middle.block ], [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %._crit_edge110.us ]
  br label %._crit_edge146

._crit_edge146:                                   ; preds = %._crit_edge146.preheader, %._crit_edge146
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %._crit_edge146 ], [ %indvars.iv132.ph, %._crit_edge146.preheader ]
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %81, i64 %indvars.iv136, i64 %indvars.iv132
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv136, i64 %indvars.iv132
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, 2.000000e+00
  %122 = fsub double %118, %121
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %82, i64 %indvars.iv136, i64 %indvars.iv132
  %124 = load double, double* %123, align 8
  %125 = fadd double %124, %122
  %126 = fmul double %125, 1.250000e-01
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv.next137, i64 %indvars.iv132
  %128 = load double, double* %127, align 8
  %129 = fsub double %128, %121
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %84, i64 %indvars.iv132
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  %133 = fmul double %132, 1.250000e-01
  %134 = fadd double %126, %133
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv136, i64 %indvars.iv.next133
  %136 = load double, double* %135, align 8
  %137 = fsub double %136, %121
  %138 = add nsw i64 %indvars.iv132, -1
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv140, i64 %indvars.iv136, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fadd double %137, %140
  %142 = fmul double %141, 1.250000e-01
  %143 = fadd double %134, %142
  %144 = fadd double %120, %143
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv140, i64 %indvars.iv136, i64 %indvars.iv132
  store double %144, double* %145, align 8
  %exitcond148 = icmp eq i64 %indvars.iv.next133, %7
  br i1 %exitcond148, label %._crit_edge118.us.loopexit, label %._crit_edge146, !llvm.loop !16

._crit_edge118.us.loopexit:                       ; preds = %._crit_edge146
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %._crit_edge118.us.loopexit, %middle.block
  %exitcond139 = icmp eq i64 %indvars.iv.next137, %wide.trip.count138
  br i1 %exitcond139, label %._crit_edge120, label %._crit_edge118.us.._crit_edge110.us_crit_edge

._crit_edge118.us.._crit_edge110.us_crit_edge:    ; preds = %._crit_edge118.us
  %indvar.next151 = add i64 %indvar150, 1
  br label %._crit_edge110.us

._crit_edge120:                                   ; preds = %._crit_edge118.us
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond149 = icmp eq i64 %indvars.iv.next141, %7
  br i1 %exitcond149, label %._crit_edge122.loopexit, label %._crit_edge120.._crit_edge110.lr.ph_crit_edge

._crit_edge120.._crit_edge110.lr.ph_crit_edge:    ; preds = %._crit_edge120
  %indvar.next = add i64 %indvar, 1
  br label %._crit_edge110.lr.ph

._crit_edge122.loopexit:                          ; preds = %._crit_edge120
  br label %._crit_edge122

._crit_edge122:                                   ; preds = %._crit_edge122.loopexit, %._crit_edge107, %._crit_edge
  %146 = add nuw nsw i32 %storemerge123, 1
  %exitcond144 = icmp eq i32 %146, 501
  br i1 %exitcond144, label %147, label %._crit_edge

; <label>:147:                                    ; preds = %._crit_edge122
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
  br i1 %7, label %._crit_edge.lr.ph, label %._crit_edge22

._crit_edge.lr.ph:                                ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  %11 = zext i32 %0 to i64
  br label %._crit_edge15.us.us.preheader

._crit_edge15.us.us.preheader:                    ; preds = %._crit_edge20.us, %._crit_edge.lr.ph
  %indvars.iv37 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next38, %._crit_edge20.us ]
  %12 = mul nsw i64 %indvars.iv37, %8
  %13 = trunc i64 %12 to i32
  br label %._crit_edge15.us.us

._crit_edge20.us:                                 ; preds = %._crit_edge18.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next38, %11
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %._crit_edge15.us.us.preheader

._crit_edge15.us.us:                              ; preds = %._crit_edge18.us.us, %._crit_edge15.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %._crit_edge15.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge18.us.us ]
  %14 = trunc i64 %indvars.iv33 to i32
  %15 = add i32 %14, %13
  %16 = mul i32 %15, %0
  %17 = zext i32 %16 to i64
  br label %._crit_edge16.us.us._crit_edge

._crit_edge18.us.us:                              ; preds = %._crit_edge16.us.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, %10
  br i1 %exitcond, label %._crit_edge20.us, label %._crit_edge15.us.us

._crit_edge16.us.us._crit_edge:                   ; preds = %._crit_edge16.us.us, %._crit_edge15.us.us
  %indvars.iv = phi i64 [ 0, %._crit_edge15.us.us ], [ %indvars.iv.next, %._crit_edge16.us.us ]
  %18 = add i64 %indvars.iv, %17
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %._crit_edge16.us.us

; <label>:22:                                     ; preds = %._crit_edge16.us.us._crit_edge
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %23) #5
  br label %._crit_edge16.us.us

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us._crit_edge, %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond41, label %._crit_edge18.us.us, label %._crit_edge16.us.us._crit_edge

._crit_edge22.loopexit:                           ; preds = %._crit_edge20.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %2
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %30) #5
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
