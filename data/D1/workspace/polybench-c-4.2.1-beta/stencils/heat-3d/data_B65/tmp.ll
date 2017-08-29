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
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader23.lr.ph, label %._crit_edge28

.preheader23.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %wide.trip.count40 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count43 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge26.us, %.preheader23.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader23.lr.ph ], [ %indvars.iv.next42, %._crit_edge26.us ]
  %8 = trunc i64 %indvars.iv41 to i32
  %9 = add i32 %8, %0
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge28.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv38 to i32
  %11 = add i32 %9, %10
  br i1 %6, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %14, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

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
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %11, %17
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %21, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = trunc i64 %indvars.iv.next to i32
  %25 = sub i32 %11, %24
  %26 = sitofp i32 %25 to double
  %27 = fmul double %26, 1.000000e+01
  %28 = fdiv double %27, %5
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %28, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge28.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %5 = add nsw i32 %1, -1
  %6 = add nsw i32 %1, -1
  %7 = add nsw i32 %1, -1
  %8 = add nsw i32 %1, -1
  %9 = add nsw i32 %1, -1
  %10 = add nsw i32 %1, -1
  %wide.trip.count133 = zext i32 %6 to i64
  %wide.trip.count = zext i32 %6 to i64
  %wide.trip.count137 = zext i32 %6 to i64
  %wide.trip.count146 = zext i32 %6 to i64
  %wide.trip.count142 = zext i32 %6 to i64
  %wide.trip.count150 = zext i32 %6 to i64
  %11 = add nsw i64 %wide.trip.count142, -1
  %12 = icmp sgt i32 %5, 1
  %13 = icmp sgt i32 %8, 1
  %14 = icmp sgt i32 %9, 1
  %15 = icmp sgt i32 %10, 1
  %min.iters.check = icmp ult i64 %11, 2
  %n.vec = and i64 %11, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %11, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %16 = icmp sgt i32 %6, 1
  %17 = icmp sgt i32 %7, 1
  %min.iters.check175 = icmp ult i64 %11, 2
  %n.vec178 = and i64 %11, -2
  %cmp.zero179 = icmp eq i64 %n.vec178, 0
  %ind.end202 = or i64 %11, 1
  %cmp.n203 = icmp eq i64 %11, %n.vec178
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %178, %._crit_edge127 ]
  br i1 %12, label %.preheader114.preheader, label %.preheader115

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader115.loopexit:                           ; preds = %._crit_edge119
  br label %.preheader115

.preheader115:                                    ; preds = %.preheader115.loopexit, %.preheader116
  br i1 %13, label %.preheader113.preheader, label %._crit_edge127

.preheader113.preheader:                          ; preds = %.preheader115
  br label %.preheader113

.preheader114:                                    ; preds = %.preheader114.preheader, %._crit_edge119
  %indvar181 = phi i64 [ %indvar.next182, %._crit_edge119 ], [ 0, %.preheader114.preheader ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge119 ], [ 1, %.preheader114.preheader ]
  %18 = add i64 %indvar181, 1
  %19 = add i64 %indvar181, 2
  br i1 %16, label %.preheader112.lr.ph, label %._crit_edge119

.preheader112.lr.ph:                              ; preds = %.preheader114
  %20 = add nuw nsw i64 %indvars.iv135, 1
  %21 = add nsw i64 %indvars.iv135, -1
  br i1 %17, label %.preheader112.us.preheader, label %._crit_edge119

.preheader112.us.preheader:                       ; preds = %.preheader112.lr.ph
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %.preheader112.us.preheader, %._crit_edge.us
  %indvar183 = phi i64 [ %indvar.next184, %._crit_edge.us ], [ 0, %.preheader112.us.preheader ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge.us ], [ 1, %.preheader112.us.preheader ]
  %22 = add i64 %indvar183, 1
  %scevgep185 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %18, i64 %22, i64 1
  %scevgep187 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %18, i64 %22, i64 %wide.trip.count142
  %scevgep189 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar181, i64 %22, i64 1
  %scevgep191 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %19, i64 %22, i64 %wide.trip.count142
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %23 = add nsw i64 %indvars.iv131, -1
  br i1 %min.iters.check175, label %._crit_edge.preheader, label %min.iters.checked176

min.iters.checked176:                             ; preds = %.preheader112.us
  br i1 %cmp.zero179, label %._crit_edge.preheader, label %vector.memcheck197

vector.memcheck197:                               ; preds = %min.iters.checked176
  %bound0193 = icmp ult double* %scevgep185, %scevgep191
  %bound1194 = icmp ult double* %scevgep189, %scevgep187
  %memcheck.conflict196 = and i1 %bound0193, %bound1194
  br i1 %memcheck.conflict196, label %._crit_edge.preheader, label %vector.body172.preheader

vector.body172.preheader:                         ; preds = %vector.memcheck197
  br label %vector.body172

vector.body172:                                   ; preds = %vector.body172.preheader, %vector.body172
  %index199 = phi i64 [ %index.next200, %vector.body172 ], [ 0, %vector.body172.preheader ]
  %offset.idx204 = or i64 %index199, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %20, i64 %indvars.iv131, i64 %offset.idx204
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load208 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %offset.idx204
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load209 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fmul <2 x double> %wide.load209, <double 2.000000e+00, double 2.000000e+00>
  %29 = fsub <2 x double> %wide.load208, %28
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %21, i64 %indvars.iv131, i64 %offset.idx204
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load210 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %wide.load210, %29
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv.next132, i64 %offset.idx204
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load211 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = bitcast double* %26 to <2 x double>*
  %wide.load212 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fmul <2 x double> %wide.load212, <double 2.000000e+00, double 2.000000e+00>
  %38 = fsub <2 x double> %wide.load211, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %23, i64 %offset.idx204
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load213 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %wide.load213, %38
  %42 = fmul <2 x double> %41, <double 1.250000e-01, double 1.250000e-01>
  %43 = fadd <2 x double> %33, %42
  %44 = add nuw nsw i64 %offset.idx204, 1
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %44
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load214 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !1
  %47 = bitcast double* %26 to <2 x double>*
  %wide.load215 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1
  %48 = fmul <2 x double> %wide.load215, <double 2.000000e+00, double 2.000000e+00>
  %49 = fsub <2 x double> %wide.load214, %48
  %50 = add nsw i64 %offset.idx204, -1
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %50
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load216 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !1
  %53 = fadd <2 x double> %wide.load216, %49
  %54 = fmul <2 x double> %53, <double 1.250000e-01, double 1.250000e-01>
  %55 = fadd <2 x double> %43, %54
  %56 = bitcast double* %26 to <2 x double>*
  %wide.load217 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1
  %57 = fadd <2 x double> %wide.load217, %55
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv135, i64 %indvars.iv131, i64 %offset.idx204
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !4, !noalias !1
  %index.next200 = add i64 %index199, 2
  %60 = icmp eq i64 %index.next200, %n.vec178
  br i1 %60, label %middle.block173, label %vector.body172, !llvm.loop !6

middle.block173:                                  ; preds = %vector.body172
  br i1 %cmp.n203, label %._crit_edge.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block173, %vector.memcheck197, %min.iters.checked176, %.preheader112.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck197 ], [ 1, %min.iters.checked176 ], [ 1, %.preheader112.us ], [ %ind.end202, %middle.block173 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %20, i64 %indvars.iv131, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, 2.000000e+00
  %66 = fsub double %62, %65
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %21, i64 %indvars.iv131, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  %70 = fmul double %69, 1.250000e-01
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv.next132, i64 %indvars.iv
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, 2.000000e+00
  %76 = fsub double %72, %75
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %23, i64 %indvars.iv
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  %80 = fmul double %79, 1.250000e-01
  %81 = fadd double %70, %80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv.next
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 2.000000e+00
  %87 = fsub double %83, %86
  %88 = add nsw i64 %indvars.iv, -1
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %88
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %87
  %92 = fmul double %91, 1.250000e-01
  %93 = fadd double %81, %92
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv135, i64 %indvars.iv131, i64 %indvars.iv
  store double %96, double* %97, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block173
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %wide.trip.count133
  %indvar.next184 = add i64 %indvar183, 1
  br i1 %exitcond134, label %._crit_edge119.loopexit, label %.preheader112.us

._crit_edge119.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge119.loopexit, %.preheader112.lr.ph, %.preheader114
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next136, %wide.trip.count137
  %indvar.next182 = add i64 %indvar181, 1
  br i1 %exitcond138, label %.preheader115.loopexit, label %.preheader114

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge125
  %indvar = phi i64 [ %indvar.next, %._crit_edge125 ], [ 0, %.preheader113.preheader ]
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %._crit_edge125 ], [ 1, %.preheader113.preheader ]
  %98 = add i64 %indvar, 1
  %99 = add i64 %indvar, 2
  br i1 %14, label %.preheader.lr.ph, label %._crit_edge125

.preheader.lr.ph:                                 ; preds = %.preheader113
  %100 = add nuw nsw i64 %indvars.iv148, 1
  %101 = add nsw i64 %indvars.iv148, -1
  br i1 %15, label %.preheader.us.preheader, label %._crit_edge125

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge123.us
  %indvar154 = phi i64 [ %indvar.next155, %._crit_edge123.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %._crit_edge123.us ], [ 1, %.preheader.us.preheader ]
  %102 = add i64 %indvar154, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %98, i64 %102, i64 1
  %scevgep157 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %98, i64 %102, i64 %wide.trip.count142
  %scevgep159 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %102, i64 1
  %scevgep161 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %99, i64 %102, i64 %wide.trip.count142
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %103 = add nsw i64 %indvars.iv144, -1
  br i1 %min.iters.check, label %._crit_edge153.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %._crit_edge153.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep161
  %bound1 = icmp ult double* %scevgep159, %scevgep157
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge153.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %100, i64 %indvars.iv144, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fmul <2 x double> %wide.load163, <double 2.000000e+00, double 2.000000e+00>
  %109 = fsub <2 x double> %wide.load, %108
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %101, i64 %indvars.iv144, i64 %offset.idx
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fadd <2 x double> %wide.load164, %109
  %113 = fmul <2 x double> %112, <double 1.250000e-01, double 1.250000e-01>
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv.next145, i64 %offset.idx
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = bitcast double* %106 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !10
  %117 = fmul <2 x double> %wide.load166, <double 2.000000e+00, double 2.000000e+00>
  %118 = fsub <2 x double> %wide.load165, %117
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %103, i64 %offset.idx
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !10
  %121 = fadd <2 x double> %wide.load167, %118
  %122 = fmul <2 x double> %121, <double 1.250000e-01, double 1.250000e-01>
  %123 = fadd <2 x double> %113, %122
  %124 = add nuw nsw i64 %offset.idx, 1
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %124
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !10
  %127 = bitcast double* %106 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !10
  %128 = fmul <2 x double> %wide.load169, <double 2.000000e+00, double 2.000000e+00>
  %129 = fsub <2 x double> %wide.load168, %128
  %130 = add nsw i64 %offset.idx, -1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %130
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !10
  %133 = fadd <2 x double> %wide.load170, %129
  %134 = fmul <2 x double> %133, <double 1.250000e-01, double 1.250000e-01>
  %135 = fadd <2 x double> %123, %134
  %136 = bitcast double* %106 to <2 x double>*
  %wide.load171 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !10
  %137 = fadd <2 x double> %wide.load171, %135
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv148, i64 %indvars.iv144, i64 %offset.idx
  %139 = bitcast double* %138 to <2 x double>*
  store <2 x double> %137, <2 x double>* %139, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %140 = icmp eq i64 %index.next, %n.vec
  br i1 %140, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge123.us, label %._crit_edge153.preheader

._crit_edge153.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv140.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %._crit_edge153

._crit_edge153:                                   ; preds = %._crit_edge153.preheader, %._crit_edge153
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge153 ], [ %indvars.iv140.ph, %._crit_edge153.preheader ]
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %100, i64 %indvars.iv144, i64 %indvars.iv140
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  %144 = load double, double* %143, align 8
  %145 = fmul double %144, 2.000000e+00
  %146 = fsub double %142, %145
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %101, i64 %indvars.iv144, i64 %indvars.iv140
  %148 = load double, double* %147, align 8
  %149 = fadd double %148, %146
  %150 = fmul double %149, 1.250000e-01
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv.next145, i64 %indvars.iv140
  %152 = load double, double* %151, align 8
  %153 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  %154 = load double, double* %153, align 8
  %155 = fmul double %154, 2.000000e+00
  %156 = fsub double %152, %155
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %103, i64 %indvars.iv140
  %158 = load double, double* %157, align 8
  %159 = fadd double %158, %156
  %160 = fmul double %159, 1.250000e-01
  %161 = fadd double %150, %160
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %162 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv.next141
  %163 = load double, double* %162, align 8
  %164 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  %165 = load double, double* %164, align 8
  %166 = fmul double %165, 2.000000e+00
  %167 = fsub double %163, %166
  %168 = add nsw i64 %indvars.iv140, -1
  %169 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %168
  %170 = load double, double* %169, align 8
  %171 = fadd double %170, %167
  %172 = fmul double %171, 1.250000e-01
  %173 = fadd double %161, %172
  %174 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  %175 = load double, double* %174, align 8
  %176 = fadd double %175, %173
  %177 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv148, i64 %indvars.iv144, i64 %indvars.iv140
  store double %176, double* %177, align 8
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge123.us.loopexit, label %._crit_edge153, !llvm.loop !16

._crit_edge123.us.loopexit:                       ; preds = %._crit_edge153
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %middle.block
  %exitcond147 = icmp eq i64 %indvars.iv.next145, %wide.trip.count146
  %indvar.next155 = add i64 %indvar154, 1
  br i1 %exitcond147, label %._crit_edge125.loopexit, label %.preheader.us

._crit_edge125.loopexit:                          ; preds = %._crit_edge123.us
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit, %.preheader.lr.ph, %.preheader113
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next149, %wide.trip.count150
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond151, label %._crit_edge127.loopexit, label %.preheader113

._crit_edge127.loopexit:                          ; preds = %._crit_edge125
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %._crit_edge127.loopexit, %.preheader115
  %178 = add nuw nsw i32 %.0111128, 1
  %exitcond152 = icmp eq i32 %178, 501
  br i1 %exitcond152, label %179, label %.preheader116

; <label>:179:                                    ; preds = %._crit_edge127
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
  br i1 %7, label %.preheader20.lr.ph, label %._crit_edge25

.preheader20.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  %wide.trip.count41 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge23.us, %.preheader20.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader20.lr.ph ], [ %indvars.iv.next40, %._crit_edge23.us ]
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
  br label %._crit_edge43

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %._crit_edge23.us, label %.preheader.us.us

._crit_edge43:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %15 = add i64 %indvars.iv, %14
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge43
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge43, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge43

._crit_edge25.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #4
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
