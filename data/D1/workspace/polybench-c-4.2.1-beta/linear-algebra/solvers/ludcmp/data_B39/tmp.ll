; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph55, label %._crit_edge67.thread

._crit_edge67.thread:                             ; preds = %5
  br label %._crit_edge69

.lr.ph55:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter221 = and i64 %11, 1
  %lcmp.mod222 = icmp eq i64 %xtraiter221, 0
  br i1 %lcmp.mod222, label %._crit_edge68.prol.loopexit, label %._crit_edge68.prol.preheader

._crit_edge68.prol.preheader:                     ; preds = %.lr.ph55
  br label %._crit_edge68.prol

._crit_edge68.prol:                               ; preds = %._crit_edge68.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge68.prol.loopexit

._crit_edge68.prol.loopexit:                      ; preds = %.lr.ph55, %._crit_edge68.prol
  %indvars.iv123.unr = phi i64 [ 0, %.lr.ph55 ], [ 1, %._crit_edge68.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %._crit_edge67, label %.lr.ph55.new

.lr.ph55.new:                                     ; preds = %._crit_edge68.prol.loopexit
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph55.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr, %.lr.ph55.new ], [ %indvars.iv.next124.1, %._crit_edge68 ]
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv123
  %17 = bitcast double* %16 to <2 x double>*
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv123
  %19 = bitcast double* %18 to <2 x double>*
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %20 = trunc i64 %indvars.iv.next124 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv123
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %23 = trunc i64 %indvars.iv.next124.1 to i32
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %9, i32 0
  %26 = insertelement <2 x double> %25, double %9, i32 1
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = fdiv <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %22 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %33 = icmp slt i64 %indvars.iv.next124.1, %11
  br i1 %33, label %._crit_edge68, label %._crit_edge67.unr-lcssa

._crit_edge67.unr-lcssa:                          ; preds = %._crit_edge68
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge68.prol.loopexit, %._crit_edge67.unr-lcssa
  br i1 true, label %.lr.ph48, label %._crit_edge67.._crit_edge69_crit_edge

._crit_edge67.._crit_edge69_crit_edge:            ; preds = %._crit_edge67
  br label %._crit_edge69

.lr.ph48:                                         ; preds = %._crit_edge67
  %34 = add i32 %0, -1
  %wide.trip.count = sext i32 %34 to i64
  %35 = add nsw i64 %wide.trip.count, 1
  br label %36

; <label>:36:                                     ; preds = %._crit_edge44, %.lr.ph48
  %indvar133 = phi i32 [ %41, %._crit_edge44 ], [ 0, %.lr.ph48 ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge44 ], [ 0, %.lr.ph48 ]
  %indvars.iv117.in = phi i32 [ %indvars.iv117, %._crit_edge44 ], [ 0, %.lr.ph48 ]
  %indvars.iv113 = phi i32 [ %indvars.iv.next114, %._crit_edge44 ], [ 0, %.lr.ph48 ]
  %37 = sub i64 %wide.trip.count, %indvars.iv121
  %38 = add i64 %37, -4
  %39 = lshr i64 %38, 2
  %40 = add nuw nsw i64 %39, 1
  %41 = add i32 %indvar133, 1
  %42 = sext i32 %41 to i64
  %43 = sub nsw i64 %35, %42
  %indvars.iv117 = add i32 %indvars.iv117.in, 1
  %44 = sext i32 %indvars.iv117 to i64
  %45 = icmp sgt i64 %indvars.iv121, -1
  br i1 %45, label %.lr.ph38, label %._crit_edge39

.lr.ph38:                                         ; preds = %36
  %wide.trip.count115 = zext i32 %indvars.iv113 to i64
  br label %46

; <label>:46:                                     ; preds = %46, %.lr.ph38
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %46 ], [ 0, %.lr.ph38 ]
  %47 = sub nsw i64 0, %indvars.iv109
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, %0
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %9
  %52 = fadd double %51, 1.000000e+00
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv109
  store double %52, double* %53, align 8
  %exitcond116 = icmp eq i64 %indvars.iv109, %wide.trip.count115
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  br i1 %exitcond116, label %._crit_edge39.loopexit, label %46

._crit_edge39.loopexit:                           ; preds = %46
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %36
  %indvars.iv.next122 = add i64 %indvars.iv121, 1
  %54 = icmp slt i64 %indvars.iv.next122, %11
  br i1 %54, label %.lr.ph43.preheader, label %._crit_edge44

.lr.ph43.preheader:                               ; preds = %._crit_edge39
  %min.iters.check = icmp ult i64 %43, 4
  br i1 %min.iters.check, label %.lr.ph43.preheader206, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph43.preheader
  %n.vec = and i64 %43, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %44, %n.vec
  br i1 %cmp.zero, label %.lr.ph43.preheader206, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter218 = and i64 %40, 3
  %lcmp.mod219 = icmp eq i64 %xtraiter218, 0
  br i1 %lcmp.mod219, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter220 = phi i64 [ %prol.iter220.sub, %vector.body.prol ], [ %xtraiter218, %vector.body.prol.preheader ]
  %55 = add i64 %44, %index.prol
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %57, align 8
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %59, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter220.sub = add i64 %prol.iter220, -1
  %prol.iter220.cmp = icmp eq i64 %prol.iter220.sub, 0
  br i1 %prol.iter220.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %60 = icmp ult i64 %38, 12
  br i1 %60, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %61 = add i64 %44, %index
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %63, align 8
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %65, align 8
  %index.next = add i64 %index, 4
  %66 = add i64 %44, %index.next
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %68, align 8
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %70, align 8
  %index.next.1 = add i64 %index, 8
  %71 = add i64 %44, %index.next.1
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %73, align 8
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %75, align 8
  %index.next.2 = add i64 %index, 12
  %76 = add i64 %44, %index.next.2
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %78, align 8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %80, align 8
  %index.next.3 = add i64 %index, 16
  %81 = icmp eq i64 %index.next.3, %n.vec
  br i1 %81, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %43, %n.vec
  br i1 %cmp.n, label %._crit_edge44, label %.lr.ph43.preheader206

.lr.ph43.preheader206:                            ; preds = %middle.block, %min.iters.checked, %.lr.ph43.preheader
  %indvars.iv119.ph = phi i64 [ %44, %min.iters.checked ], [ %44, %.lr.ph43.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph43

.lr.ph43:                                         ; preds = %.lr.ph43.preheader206, %.lr.ph43
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %.lr.ph43 ], [ %indvars.iv119.ph, %.lr.ph43.preheader206 ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv119
  store double 0.000000e+00, double* %82, align 8
  %exitcond = icmp eq i64 %indvars.iv119, %wide.trip.count
  %indvars.iv.next120 = add nsw i64 %indvars.iv119, 1
  br i1 %exitcond, label %._crit_edge44.loopexit, label %.lr.ph43, !llvm.loop !6

._crit_edge44.loopexit:                           ; preds = %.lr.ph43
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit, %middle.block, %._crit_edge39
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv121
  store double 1.000000e+00, double* %83, align 8
  %indvars.iv.next114 = add i32 %indvars.iv113, 1
  br i1 %54, label %36, label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge44
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge67.._crit_edge69_crit_edge, %._crit_edge67.thread, %._crit_edge49
  %84 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %85 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %84, i8** %85, align 8
  %86 = bitcast i8* %84 to [2000 x [2000 x double]]*
  br i1 %10, label %.lr.ph31, label %._crit_edge73.thread

._crit_edge73.thread:                             ; preds = %._crit_edge69
  br label %._crit_edge1.preheader

.lr.ph31:                                         ; preds = %._crit_edge69
  br i1 true, label %.lr.ph31..lr.ph31.split.us_crit_edge, label %.lr.ph31.._crit_edge73_crit_edge

.lr.ph31.._crit_edge73_crit_edge:                 ; preds = %.lr.ph31
  br label %._crit_edge73

.lr.ph31..lr.ph31.split.us_crit_edge:             ; preds = %.lr.ph31
  %87 = add i32 %0, -1
  %88 = zext i32 %87 to i64
  %89 = shl nuw nsw i64 %88, 3
  %90 = add nuw nsw i64 %89, 8
  %91 = sext i32 %0 to i64
  %92 = add nsw i64 %91, -1
  %xtraiter215 = and i64 %91, 3
  %lcmp.mod216 = icmp eq i64 %xtraiter215, 0
  br i1 %lcmp.mod216, label %._crit_edge27.us.prol.loopexit, label %._crit_edge27.us.prol.preheader

._crit_edge27.us.prol.preheader:                  ; preds = %.lr.ph31..lr.ph31.split.us_crit_edge
  br label %._crit_edge27.us.prol

._crit_edge27.us.prol:                            ; preds = %._crit_edge27.us.prol, %._crit_edge27.us.prol.preheader
  %indvars.iv106.prol = phi i64 [ %indvars.iv.next107.prol, %._crit_edge27.us.prol ], [ 0, %._crit_edge27.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge27.us.prol ], [ 0, %._crit_edge27.us.prol.preheader ]
  %prol.iter217 = phi i64 [ %prol.iter217.sub, %._crit_edge27.us.prol ], [ %xtraiter215, %._crit_edge27.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvar.prol, i64 0
  %scevgep105.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.prol, i8 0, i64 %90, i32 8, i1 false)
  %indvars.iv.next107.prol = add i64 %indvars.iv106.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter217.sub = add i64 %prol.iter217, -1
  %prol.iter217.cmp = icmp eq i64 %prol.iter217.sub, 0
  br i1 %prol.iter217.cmp, label %._crit_edge27.us.prol.loopexit.unr-lcssa, label %._crit_edge27.us.prol, !llvm.loop !8

._crit_edge27.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge27.us.prol
  br label %._crit_edge27.us.prol.loopexit

._crit_edge27.us.prol.loopexit:                   ; preds = %.lr.ph31..lr.ph31.split.us_crit_edge, %._crit_edge27.us.prol.loopexit.unr-lcssa
  %indvars.iv106.unr = phi i64 [ 0, %.lr.ph31..lr.ph31.split.us_crit_edge ], [ %indvars.iv.next107.prol, %._crit_edge27.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph31..lr.ph31.split.us_crit_edge ], [ %indvar.next.prol, %._crit_edge27.us.prol.loopexit.unr-lcssa ]
  %93 = icmp ult i64 %92, 3
  br i1 %93, label %._crit_edge73.loopexit, label %.lr.ph31..lr.ph31.split.us_crit_edge.new

.lr.ph31..lr.ph31.split.us_crit_edge.new:         ; preds = %._crit_edge27.us.prol.loopexit
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us, %.lr.ph31..lr.ph31.split.us_crit_edge.new
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr, %.lr.ph31..lr.ph31.split.us_crit_edge.new ], [ %indvars.iv.next107.3, %._crit_edge27.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph31..lr.ph31.split.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge27.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvar, i64 0
  %scevgep105 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105, i8 0, i64 %90, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvar.next, i64 0
  %scevgep105.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.1, i8 0, i64 %90, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvar.next.1, i64 0
  %scevgep105.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.2, i8 0, i64 %90, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvar.next.2, i64 0
  %scevgep105.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105.3, i8 0, i64 %90, i32 8, i1 false)
  %indvars.iv.next107.3 = add i64 %indvars.iv106, 4
  %94 = icmp slt i64 %indvars.iv.next107.3, %91
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %94, label %._crit_edge27.us, label %._crit_edge73.loopexit.unr-lcssa

._crit_edge73.loopexit.unr-lcssa:                 ; preds = %._crit_edge27.us
  br label %._crit_edge73.loopexit

._crit_edge73.loopexit:                           ; preds = %._crit_edge27.us.prol.loopexit, %._crit_edge73.loopexit.unr-lcssa
  %.pr131.pre = load i32, i32* %6, align 4
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %.lr.ph31.._crit_edge73_crit_edge, %._crit_edge73.loopexit
  %95 = phi i32 [ %0, %.lr.ph31.._crit_edge73_crit_edge ], [ %.pr131.pre, %._crit_edge73.loopexit ]
  %96 = icmp sgt i32 %95, 0
  br i1 %96, label %._crit_edge.preheader.lr.ph, label %._crit_edge1.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %._crit_edge73
  %97 = load [2000 x double]*, [2000 x double]** %7, align 8
  %98 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  br i1 true, label %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge, label %._crit_edge.preheader.preheader

._crit_edge.preheader.preheader:                  ; preds = %._crit_edge.preheader.lr.ph
  br i1 undef, label %._crit_edge.preheader.prol.preheader, label %._crit_edge.preheader.prol.loopexit

._crit_edge.preheader.prol.preheader:             ; preds = %._crit_edge.preheader.preheader
  br label %._crit_edge.preheader.prol

._crit_edge.preheader.prol:                       ; preds = %._crit_edge.preheader.prol, %._crit_edge.preheader.prol.preheader
  br i1 false, label %._crit_edge.preheader.prol, label %._crit_edge.preheader.prol.loopexit.unr-lcssa, !llvm.loop !9

._crit_edge.preheader.prol.loopexit.unr-lcssa:    ; preds = %._crit_edge.preheader.prol
  br label %._crit_edge.preheader.prol.loopexit

._crit_edge.preheader.prol.loopexit:              ; preds = %._crit_edge.preheader.prol.loopexit.unr-lcssa, %._crit_edge.preheader.preheader
  br i1 undef, label %.._crit_edge1.preheader_crit_edge.loopexit, label %._crit_edge.preheader.preheader.new

._crit_edge.preheader.preheader.new:              ; preds = %._crit_edge.preheader.prol.loopexit
  br label %._crit_edge.preheader

._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge: ; preds = %._crit_edge.preheader.lr.ph
  %99 = add i32 %95, -1
  %100 = sext i32 %95 to i64
  %wide.trip.count97 = zext i32 %99 to i64
  %101 = add nuw nsw i64 %wide.trip.count97, 1
  %102 = add nuw nsw i64 %wide.trip.count97, 1
  %min.iters.check139 = icmp ult i64 %101, 4
  %n.vec142 = and i64 %101, 8589934588
  %cmp.zero143 = icmp eq i64 %n.vec142, 0
  %cmp.n165 = icmp eq i64 %101, %n.vec142
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us-lcssa.us.us, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge
  %indvar151 = phi i64 [ %103, %._crit_edge._crit_edge.us-lcssa.us.us ], [ 0, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge ]
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %._crit_edge._crit_edge.us-lcssa.us.us ], [ 0, %._crit_edge.preheader.lr.ph.._crit_edge.preheader.us_crit_edge ]
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %97, i64 0, i64 %indvar151
  %103 = add i64 %indvar151, 1
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %97, i64 %wide.trip.count97, i64 %103
  br i1 true, label %.lr.ph14.us, label %._crit_edge.preheader.us.._crit_edge._crit_edge.us-lcssa.us.us_crit_edge

._crit_edge.preheader.us.._crit_edge._crit_edge.us-lcssa.us.us_crit_edge: ; preds = %._crit_edge.preheader.us
  br label %._crit_edge._crit_edge.us-lcssa.us.us

.lr.ph14.us:                                      ; preds = %._crit_edge.preheader.us
  br label %.lr.ph11.us.us

._crit_edge._crit_edge.us-lcssa.us.us.loopexit:   ; preds = %._crit_edge.us.us
  br label %._crit_edge._crit_edge.us-lcssa.us.us

._crit_edge._crit_edge.us-lcssa.us.us:            ; preds = %._crit_edge.preheader.us.._crit_edge._crit_edge.us-lcssa.us.us_crit_edge, %._crit_edge._crit_edge.us-lcssa.us.us.loopexit
  %indvars.iv.next102 = add i64 %indvars.iv101, 1
  %104 = icmp slt i64 %indvars.iv.next102, %100
  br i1 %104, label %._crit_edge.preheader.us, label %._crit_edge._crit_edge.us-lcssa.us.us..._crit_edge1.preheader_crit_edge_crit_edge

._crit_edge._crit_edge.us-lcssa.us.us..._crit_edge1.preheader_crit_edge_crit_edge: ; preds = %._crit_edge._crit_edge.us-lcssa.us.us
  br label %.._crit_edge1.preheader_crit_edge

.lr.ph11.us.us:                                   ; preds = %._crit_edge.us.us, %.lr.ph14.us
  %indvar145 = phi i64 [ %indvar.next146, %._crit_edge.us.us ], [ 0, %.lr.ph14.us ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge.us.us ], [ 0, %.lr.ph14.us ]
  %scevgep147 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvar145, i64 0
  %scevgep149 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvar145, i64 %101
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv99, i64 %indvars.iv101
  br i1 %min.iters.check139, label %scalar.ph138.preheader, label %min.iters.checked140

scalar.ph138.preheader:                           ; preds = %middle.block137, %vector.memcheck, %min.iters.checked140, %.lr.ph11.us.us
  %indvars.iv95.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked140 ], [ 0, %.lr.ph11.us.us ], [ %n.vec142, %middle.block137 ]
  %106 = sub nsw i64 %102, %indvars.iv95.ph
  %xtraiter210 = and i64 %106, 1
  %lcmp.mod211 = icmp eq i64 %xtraiter210, 0
  br i1 %lcmp.mod211, label %scalar.ph138.prol.loopexit.unr-lcssa, label %scalar.ph138.prol.preheader

scalar.ph138.prol.preheader:                      ; preds = %scalar.ph138.preheader
  br label %scalar.ph138.prol

scalar.ph138.prol:                                ; preds = %scalar.ph138.prol.preheader
  %107 = load double, double* %105, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv95.ph, i64 %indvars.iv101
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv99, i64 %indvars.iv95.ph
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  store double %113, double* %111, align 8
  %indvars.iv.next96.prol = or i64 %indvars.iv95.ph, 1
  br label %scalar.ph138.prol.loopexit.unr-lcssa

scalar.ph138.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph138.preheader, %scalar.ph138.prol
  %indvars.iv95.unr.ph = phi i64 [ %indvars.iv.next96.prol, %scalar.ph138.prol ], [ %indvars.iv95.ph, %scalar.ph138.preheader ]
  br label %scalar.ph138.prol.loopexit

scalar.ph138.prol.loopexit:                       ; preds = %scalar.ph138.prol.loopexit.unr-lcssa
  %114 = icmp eq i64 %wide.trip.count97, %indvars.iv95.ph
  br i1 %114, label %._crit_edge.us.us.loopexit, label %scalar.ph138.preheader.new

scalar.ph138.preheader.new:                       ; preds = %scalar.ph138.prol.loopexit
  br label %scalar.ph138

min.iters.checked140:                             ; preds = %.lr.ph11.us.us
  br i1 %cmp.zero143, label %scalar.ph138.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked140
  %bound0 = icmp ult double* %scevgep147, %scevgep155
  %bound1 = icmp ult double* %scevgep153, %scevgep149
  %found.conflict = and i1 %bound0, %bound1
  %bound0158 = icmp ult double* %scevgep147, %105
  %bound1159 = icmp ult double* %105, %scevgep149
  %found.conflict160 = and i1 %bound0158, %bound1159
  %conflict.rdx = or i1 %found.conflict, %found.conflict160
  br i1 %conflict.rdx, label %scalar.ph138.preheader, label %vector.body136.preheader

vector.body136.preheader:                         ; preds = %vector.memcheck
  br label %vector.body136

vector.body136:                                   ; preds = %vector.body136.preheader, %vector.body136
  %index162 = phi i64 [ %index.next163, %vector.body136 ], [ 0, %vector.body136.preheader ]
  %115 = or i64 %index162, 1
  %116 = or i64 %index162, 2
  %117 = or i64 %index162, 3
  %118 = load double, double* %105, align 8, !alias.scope !10
  %119 = insertelement <2 x double> undef, double %118, i32 0
  %120 = shufflevector <2 x double> %119, <2 x double> undef, <2 x i32> zeroinitializer
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %index162, i64 %indvars.iv101
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %115, i64 %indvars.iv101
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %116, i64 %indvars.iv101
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %117, i64 %indvars.iv101
  %125 = load double, double* %121, align 8, !alias.scope !13
  %126 = load double, double* %122, align 8, !alias.scope !13
  %127 = load double, double* %123, align 8, !alias.scope !13
  %128 = load double, double* %124, align 8, !alias.scope !13
  %129 = insertelement <2 x double> undef, double %125, i32 0
  %130 = insertelement <2 x double> %129, double %126, i32 1
  %131 = insertelement <2 x double> undef, double %127, i32 0
  %132 = insertelement <2 x double> %131, double %128, i32 1
  %133 = fmul <2 x double> %120, %130
  %134 = fmul <2 x double> %120, %132
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv99, i64 %index162
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !15, !noalias !17
  %137 = getelementptr double, double* %135, i64 2
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !15, !noalias !17
  %139 = fadd <2 x double> %133, %wide.load
  %140 = fadd <2 x double> %134, %wide.load170
  store <2 x double> %139, <2 x double>* %136, align 8, !alias.scope !15, !noalias !17
  store <2 x double> %140, <2 x double>* %138, align 8, !alias.scope !15, !noalias !17
  %index.next163 = add i64 %index162, 4
  %141 = icmp eq i64 %index.next163, %n.vec142
  br i1 %141, label %middle.block137, label %vector.body136, !llvm.loop !18

middle.block137:                                  ; preds = %vector.body136
  br i1 %cmp.n165, label %._crit_edge.us.us, label %scalar.ph138.preheader

._crit_edge.us.us.loopexit.unr-lcssa:             ; preds = %scalar.ph138
  br label %._crit_edge.us.us.loopexit

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph138.prol.loopexit, %._crit_edge.us.us.loopexit.unr-lcssa
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block137
  %indvars.iv.next100 = add i64 %indvars.iv99, 1
  %142 = icmp slt i64 %indvars.iv.next100, %100
  %indvar.next146 = add i64 %indvar145, 1
  br i1 %142, label %.lr.ph11.us.us, label %._crit_edge._crit_edge.us-lcssa.us.us.loopexit

scalar.ph138:                                     ; preds = %scalar.ph138, %scalar.ph138.preheader.new
  %indvars.iv95 = phi i64 [ %indvars.iv95.unr.ph, %scalar.ph138.preheader.new ], [ %indvars.iv.next96.1, %scalar.ph138 ]
  %143 = load double, double* %105, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv95, i64 %indvars.iv101
  %145 = load double, double* %144, align 8
  %146 = fmul double %143, %145
  %147 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv99, i64 %indvars.iv95
  %148 = load double, double* %147, align 8
  %149 = fadd double %146, %148
  store double %149, double* %147, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %150 = load double, double* %105, align 8
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv.next96, i64 %indvars.iv101
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next96
  %155 = load double, double* %154, align 8
  %156 = fadd double %153, %155
  store double %156, double* %154, align 8
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  br i1 %exitcond98.1, label %._crit_edge.us.us.loopexit.unr-lcssa, label %scalar.ph138, !llvm.loop !19

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader, %._crit_edge.preheader.preheader.new
  br i1 false, label %._crit_edge.preheader, label %.._crit_edge1.preheader_crit_edge.loopexit.unr-lcssa

.._crit_edge1.preheader_crit_edge.loopexit.unr-lcssa: ; preds = %._crit_edge.preheader
  br label %.._crit_edge1.preheader_crit_edge.loopexit

.._crit_edge1.preheader_crit_edge.loopexit:       ; preds = %._crit_edge.preheader.prol.loopexit, %.._crit_edge1.preheader_crit_edge.loopexit.unr-lcssa
  br label %.._crit_edge1.preheader_crit_edge

.._crit_edge1.preheader_crit_edge:                ; preds = %.._crit_edge1.preheader_crit_edge.loopexit, %._crit_edge._crit_edge.us-lcssa.us.us..._crit_edge1.preheader_crit_edge_crit_edge
  br label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge73, %._crit_edge73.thread, %.._crit_edge1.preheader_crit_edge
  %157 = phi i32 [ %95, %._crit_edge73 ], [ %0, %._crit_edge73.thread ], [ %95, %.._crit_edge1.preheader_crit_edge ]
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %.lr.ph5, label %._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge

._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge: ; preds = %._crit_edge1.preheader
  %.pre = load i8*, i8** %85, align 8
  br label %._crit_edge1.preheader._crit_edge

.lr.ph5:                                          ; preds = %._crit_edge1.preheader
  %159 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %160 = load [2000 x double]*, [2000 x double]** %7, align 8
  %161 = bitcast [2000 x [2000 x double]]* %159 to i8*
  br i1 true, label %.lr.ph5..lr.ph5.split.us_crit_edge, label %.lr.ph5.split.._crit_edge1._crit_edge_crit_edge

.lr.ph5..lr.ph5.split.us_crit_edge:               ; preds = %.lr.ph5
  %162 = add i32 %157, -1
  %163 = sext i32 %157 to i64
  %wide.trip.count91 = zext i32 %162 to i64
  %164 = add nuw nsw i64 %wide.trip.count91, 1
  %165 = and i64 %164, 8589934588
  %166 = add nsw i64 %165, -4
  %167 = lshr exact i64 %166, 2
  %168 = add nuw nsw i64 %wide.trip.count91, 1
  %min.iters.check174 = icmp ult i64 %164, 4
  %n.vec177 = and i64 %164, 8589934588
  %cmp.zero178 = icmp eq i64 %n.vec177, 0
  %169 = and i64 %167, 1
  %lcmp.mod = icmp eq i64 %169, 0
  %170 = icmp eq i64 %167, 0
  %cmp.n199 = icmp eq i64 %164, %n.vec177
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge1.us, %.lr.ph5..lr.ph5.split.us_crit_edge
  %indvar180 = phi i64 [ %indvar.next181, %._crit_edge1.us ], [ 0, %.lr.ph5..lr.ph5.split.us_crit_edge ]
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge1.us ], [ 0, %.lr.ph5..lr.ph5.split.us_crit_edge ]
  %scevgep182 = getelementptr [2000 x double], [2000 x double]* %160, i64 %indvar180, i64 0
  %scevgep184 = getelementptr [2000 x double], [2000 x double]* %160, i64 %indvar180, i64 %164
  %scevgep186 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvar180, i64 0
  %scevgep188 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvar180, i64 %164
  br i1 %min.iters.check174, label %scalar.ph173.preheader, label %min.iters.checked175

min.iters.checked175:                             ; preds = %.lr.ph5.split.us
  br i1 %cmp.zero178, label %scalar.ph173.preheader, label %vector.memcheck194

vector.memcheck194:                               ; preds = %min.iters.checked175
  %bound0190 = icmp ult double* %scevgep182, %scevgep188
  %bound1191 = icmp ult double* %scevgep186, %scevgep184
  %memcheck.conflict193 = and i1 %bound0190, %bound1191
  br i1 %memcheck.conflict193, label %scalar.ph173.preheader, label %vector.body171.preheader

vector.body171.preheader:                         ; preds = %vector.memcheck194
  br i1 %lcmp.mod, label %vector.body171.prol.preheader, label %vector.body171.prol.loopexit.unr-lcssa

vector.body171.prol.preheader:                    ; preds = %vector.body171.preheader
  br label %vector.body171.prol

vector.body171.prol:                              ; preds = %vector.body171.prol.preheader
  %171 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 0
  %172 = bitcast double* %171 to <2 x i64>*
  %wide.load204.prol = load <2 x i64>, <2 x i64>* %172, align 8, !alias.scope !20
  %173 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 2
  %174 = bitcast double* %173 to <2 x i64>*
  %wide.load205.prol = load <2 x i64>, <2 x i64>* %174, align 8, !alias.scope !20
  %175 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 0
  %176 = bitcast double* %175 to <2 x i64>*
  store <2 x i64> %wide.load204.prol, <2 x i64>* %176, align 8, !alias.scope !23, !noalias !20
  %177 = getelementptr [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 2
  %178 = bitcast double* %177 to <2 x i64>*
  store <2 x i64> %wide.load205.prol, <2 x i64>* %178, align 8, !alias.scope !23, !noalias !20
  br label %vector.body171.prol.loopexit.unr-lcssa

vector.body171.prol.loopexit.unr-lcssa:           ; preds = %vector.body171.preheader, %vector.body171.prol
  %index196.unr.ph = phi i64 [ 4, %vector.body171.prol ], [ 0, %vector.body171.preheader ]
  br label %vector.body171.prol.loopexit

vector.body171.prol.loopexit:                     ; preds = %vector.body171.prol.loopexit.unr-lcssa
  br i1 %170, label %middle.block172, label %vector.body171.preheader.new

vector.body171.preheader.new:                     ; preds = %vector.body171.prol.loopexit
  br label %vector.body171

vector.body171:                                   ; preds = %vector.body171, %vector.body171.preheader.new
  %index196 = phi i64 [ %index196.unr.ph, %vector.body171.preheader.new ], [ %index.next197.1, %vector.body171 ]
  %179 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %index196
  %180 = bitcast double* %179 to <2 x i64>*
  %wide.load204 = load <2 x i64>, <2 x i64>* %180, align 8, !alias.scope !20
  %181 = getelementptr double, double* %179, i64 2
  %182 = bitcast double* %181 to <2 x i64>*
  %wide.load205 = load <2 x i64>, <2 x i64>* %182, align 8, !alias.scope !20
  %183 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %index196
  %184 = bitcast double* %183 to <2 x i64>*
  store <2 x i64> %wide.load204, <2 x i64>* %184, align 8, !alias.scope !23, !noalias !20
  %185 = getelementptr double, double* %183, i64 2
  %186 = bitcast double* %185 to <2 x i64>*
  store <2 x i64> %wide.load205, <2 x i64>* %186, align 8, !alias.scope !23, !noalias !20
  %index.next197 = add i64 %index196, 4
  %187 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %index.next197
  %188 = bitcast double* %187 to <2 x i64>*
  %wide.load204.1 = load <2 x i64>, <2 x i64>* %188, align 8, !alias.scope !20
  %189 = getelementptr double, double* %187, i64 2
  %190 = bitcast double* %189 to <2 x i64>*
  %wide.load205.1 = load <2 x i64>, <2 x i64>* %190, align 8, !alias.scope !20
  %191 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %index.next197
  %192 = bitcast double* %191 to <2 x i64>*
  store <2 x i64> %wide.load204.1, <2 x i64>* %192, align 8, !alias.scope !23, !noalias !20
  %193 = getelementptr double, double* %191, i64 2
  %194 = bitcast double* %193 to <2 x i64>*
  store <2 x i64> %wide.load205.1, <2 x i64>* %194, align 8, !alias.scope !23, !noalias !20
  %index.next197.1 = add i64 %index196, 8
  %195 = icmp eq i64 %index.next197.1, %n.vec177
  br i1 %195, label %middle.block172.unr-lcssa, label %vector.body171, !llvm.loop !25

middle.block172.unr-lcssa:                        ; preds = %vector.body171
  br label %middle.block172

middle.block172:                                  ; preds = %vector.body171.prol.loopexit, %middle.block172.unr-lcssa
  br i1 %cmp.n199, label %._crit_edge1.us, label %scalar.ph173.preheader

scalar.ph173.preheader:                           ; preds = %middle.block172, %vector.memcheck194, %min.iters.checked175, %.lr.ph5.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck194 ], [ 0, %min.iters.checked175 ], [ 0, %.lr.ph5.split.us ], [ %n.vec177, %middle.block172 ]
  %196 = sub nsw i64 %168, %indvars.iv.ph
  %197 = sub nsw i64 %wide.trip.count91, %indvars.iv.ph
  %xtraiter208 = and i64 %196, 3
  %lcmp.mod209 = icmp eq i64 %xtraiter208, 0
  br i1 %lcmp.mod209, label %scalar.ph173.prol.loopexit, label %scalar.ph173.prol.preheader

scalar.ph173.prol.preheader:                      ; preds = %scalar.ph173.preheader
  br label %scalar.ph173.prol

scalar.ph173.prol:                                ; preds = %scalar.ph173.prol, %scalar.ph173.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %scalar.ph173.prol ], [ %indvars.iv.ph, %scalar.ph173.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %scalar.ph173.prol ], [ %xtraiter208, %scalar.ph173.prol.preheader ]
  %198 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %199 = bitcast double* %198 to i64*
  %200 = load i64, i64* %199, align 8
  %201 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %indvars.iv.prol
  %202 = bitcast double* %201 to i64*
  store i64 %200, i64* %202, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %scalar.ph173.prol.loopexit.unr-lcssa, label %scalar.ph173.prol, !llvm.loop !26

scalar.ph173.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph173.prol
  br label %scalar.ph173.prol.loopexit

scalar.ph173.prol.loopexit:                       ; preds = %scalar.ph173.preheader, %scalar.ph173.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %scalar.ph173.preheader ], [ %indvars.iv.next.prol, %scalar.ph173.prol.loopexit.unr-lcssa ]
  %203 = icmp ult i64 %197, 3
  br i1 %203, label %._crit_edge1.us.loopexit, label %scalar.ph173.preheader.new

scalar.ph173.preheader.new:                       ; preds = %scalar.ph173.prol.loopexit
  br label %scalar.ph173

scalar.ph173:                                     ; preds = %scalar.ph173, %scalar.ph173.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %scalar.ph173.preheader.new ], [ %indvars.iv.next.3, %scalar.ph173 ]
  %204 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %205 = bitcast double* %204 to i64*
  %206 = load i64, i64* %205, align 8
  %207 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %indvars.iv
  %208 = bitcast double* %207 to i64*
  store i64 %206, i64* %208, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %209 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %210 = bitcast double* %209 to i64*
  %211 = load i64, i64* %210, align 8
  %212 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %indvars.iv.next
  %213 = bitcast double* %212 to i64*
  store i64 %211, i64* %213, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %214 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %215 = bitcast double* %214 to i64*
  %216 = load i64, i64* %215, align 8
  %217 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %218 = bitcast double* %217 to i64*
  store i64 %216, i64* %218, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %219 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %159, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %220 = bitcast double* %219 to i64*
  %221 = load i64, i64* %220, align 8
  %222 = getelementptr inbounds [2000 x double], [2000 x double]* %160, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %223 = bitcast double* %222 to i64*
  store i64 %221, i64* %223, align 8
  %exitcond92.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count91
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond92.3, label %._crit_edge1.us.loopexit.unr-lcssa, label %scalar.ph173, !llvm.loop !27

._crit_edge1.us.loopexit.unr-lcssa:               ; preds = %scalar.ph173
  br label %._crit_edge1.us.loopexit

._crit_edge1.us.loopexit:                         ; preds = %scalar.ph173.prol.loopexit, %._crit_edge1.us.loopexit.unr-lcssa
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %._crit_edge1.us.loopexit, %middle.block172
  %indvars.iv.next94 = add i64 %indvars.iv93, 1
  %224 = icmp slt i64 %indvars.iv.next94, %163
  %indvar.next181 = add i64 %indvar180, 1
  br i1 %224, label %.lr.ph5.split.us, label %._crit_edge1.us.._crit_edge1._crit_edge_crit_edge

._crit_edge1.us.._crit_edge1._crit_edge_crit_edge: ; preds = %._crit_edge1.us
  br label %._crit_edge1._crit_edge

.lr.ph5.split.._crit_edge1._crit_edge_crit_edge:  ; preds = %.lr.ph5
  br label %._crit_edge1._crit_edge

._crit_edge1._crit_edge:                          ; preds = %.lr.ph5.split.._crit_edge1._crit_edge_crit_edge, %._crit_edge1.us.._crit_edge1._crit_edge_crit_edge
  br label %._crit_edge1.preheader._crit_edge

._crit_edge1.preheader._crit_edge:                ; preds = %._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge, %._crit_edge1._crit_edge
  %225 = phi i8* [ %.pre, %._crit_edge1.preheader.._crit_edge1.preheader._crit_edge_crit_edge ], [ %161, %._crit_edge1._crit_edge ]
  tail call void @free(i8* %225) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph56, label %._crit_edge69

.lr.ph56:                                         ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count120 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count120, 1
  br label %10

; <label>:10:                                     ; preds = %._crit_edge48, %.lr.ph56
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge48 ], [ 0, %.lr.ph56 ]
  %indvars.iv129 = phi i32 [ %15, %._crit_edge48 ], [ -1, %.lr.ph56 ]
  %11 = add i64 %indvars.iv137, 4294967295
  %12 = and i64 %11, 4294967295
  %13 = sub i64 %9, %indvars.iv137
  %14 = sub i64 %wide.trip.count120, %indvars.iv137
  %15 = add i32 %indvars.iv129, 1
  %16 = icmp sgt i64 %indvars.iv137, 0
  br i1 %16, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %10
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %._crit_edge27
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge27 ], [ 0, %.lr.ph32.preheader ]
  %indvars.iv110 = phi i32 [ %20, %._crit_edge27 ], [ -1, %.lr.ph32.preheader ]
  %18 = add i64 %indvars.iv114, 4294967295
  %19 = and i64 %18, 4294967295
  %20 = add i32 %indvars.iv110, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv114
  %22 = load double, double* %21, align 8
  %23 = icmp sgt i64 %indvars.iv114, 0
  br i1 %23, label %.lr.ph26.preheader, label %._crit_edge27

.lr.ph26.preheader:                               ; preds = %.lr.ph32
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  %24 = and i64 %18, 1
  %lcmp.mod156 = icmp eq i64 %24, 0
  br i1 %lcmp.mod156, label %.lr.ph26.prol.preheader, label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.preheader:                          ; preds = %.lr.ph26.preheader
  br label %.lr.ph26.prol

.lr.ph26.prol:                                    ; preds = %.lr.ph26.prol.preheader
  %25 = load double, double* %17, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %22, %28
  br label %.lr.ph26.prol.loopexit.unr-lcssa

.lr.ph26.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph26.preheader, %.lr.ph26.prol
  %.lcssa149.unr.ph = phi double [ %29, %.lr.ph26.prol ], [ undef, %.lr.ph26.preheader ]
  %indvars.iv104.unr.ph = phi i64 [ 1, %.lr.ph26.prol ], [ 0, %.lr.ph26.preheader ]
  %.unr157.ph = phi double [ %29, %.lr.ph26.prol ], [ %22, %.lr.ph26.preheader ]
  br label %.lr.ph26.prol.loopexit

.lr.ph26.prol.loopexit:                           ; preds = %.lr.ph26.prol.loopexit.unr-lcssa
  %30 = icmp eq i64 %19, 0
  br i1 %30, label %._crit_edge27.loopexit, label %.lr.ph26.preheader.new

.lr.ph26.preheader.new:                           ; preds = %.lr.ph26.prol.loopexit
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %.lr.ph26, %.lr.ph26.preheader.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr.ph, %.lr.ph26.preheader.new ], [ %indvars.iv.next105.1, %.lr.ph26 ]
  %31 = phi double [ %.unr157.ph, %.lr.ph26.preheader.new ], [ %45, %.lr.ph26 ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv104
  %33 = bitcast double* %32 to <2 x double>*
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv114
  %35 = load double, double* %34, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %36 = load <2 x double>, <2 x double>* %33, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next105, i64 %indvars.iv114
  %38 = load double, double* %37, align 8
  %39 = insertelement <2 x double> undef, double %35, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %36, %40
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %44 = fsub double %31, %42
  %45 = fsub double %44, %43
  %exitcond113.1 = icmp eq i64 %indvars.iv.next105, %wide.trip.count112
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  br i1 %exitcond113.1, label %._crit_edge27.loopexit.unr-lcssa, label %.lr.ph26

._crit_edge27.loopexit.unr-lcssa:                 ; preds = %.lr.ph26
  br label %._crit_edge27.loopexit

._crit_edge27.loopexit:                           ; preds = %.lr.ph26.prol.loopexit, %._crit_edge27.loopexit.unr-lcssa
  %.lcssa149 = phi double [ %.lcssa149.unr.ph, %.lr.ph26.prol.loopexit ], [ %45, %._crit_edge27.loopexit.unr-lcssa ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.lr.ph32
  %.lcssa3038 = phi double [ %22, %.lr.ph32 ], [ %.lcssa149, %._crit_edge27.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv114
  %47 = load double, double* %46, align 8
  %48 = fdiv double %.lcssa3038, %47
  store double %48, double* %21, align 8
  %indvars.iv.next115 = add nuw i64 %indvars.iv114, 1
  %49 = icmp slt i64 %indvars.iv.next115, %indvars.iv137
  br i1 %49, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %._crit_edge27
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %10
  %50 = icmp slt i64 %indvars.iv137, %8
  br i1 %50, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge33
  br i1 %16, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter158 = and i64 %13, 7
  %lcmp.mod159 = icmp eq i64 %xtraiter158, 0
  br i1 %lcmp.mod159, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv.next119.prol, %.lr.ph47.split.prol ], [ %indvars.iv137, %.lr.ph47.split.prol.preheader ]
  %prol.iter160 = phi i64 [ %prol.iter160.sub, %.lr.ph47.split.prol ], [ %xtraiter158, %.lr.ph47.split.prol.preheader ]
  %indvars.iv.next119.prol = add i64 %indvars.iv118.prol, 1
  %prol.iter160.sub = add i64 %prol.iter160, -1
  %prol.iter160.cmp = icmp eq i64 %prol.iter160.sub, 0
  br i1 %prol.iter160.cmp, label %.lr.ph47.split.prol.loopexit.unr-lcssa, label %.lr.ph47.split.prol, !llvm.loop !28

.lr.ph47.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv137, %.lr.ph47.split.preheader ], [ %indvars.iv.next119.prol, %.lr.ph47.split.prol.loopexit.unr-lcssa ]
  %51 = icmp ult i64 %14, 7
  br i1 %51, label %.lr.ph47.split.._crit_edge48_crit_edge, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %wide.trip.count131 = zext i32 %indvars.iv129 to i64
  %52 = and i64 %11, 1
  %lcmp.mod164 = icmp eq i64 %52, 0
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 0
  %54 = icmp eq i64 %12, 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge41.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge41.us ], [ %indvars.iv137, %.lr.ph47.split.us.preheader ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv135
  %56 = load double, double* %55, align 8
  br i1 %lcmp.mod164, label %.prol.preheader161, label %.prol.loopexit162.unr-lcssa

.prol.preheader161:                               ; preds = %.lr.ph47.split.us
  br label %57

; <label>:57:                                     ; preds = %.prol.preheader161
  %58 = load double, double* %53, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fsub double %56, %61
  br label %.prol.loopexit162.unr-lcssa

.prol.loopexit162.unr-lcssa:                      ; preds = %.lr.ph47.split.us, %57
  %.lcssa150.unr.ph = phi double [ %62, %57 ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv123.unr.ph = phi i64 [ 1, %57 ], [ 0, %.lr.ph47.split.us ]
  %.unr165.ph = phi double [ %62, %57 ], [ %56, %.lr.ph47.split.us ]
  br label %.prol.loopexit162

.prol.loopexit162:                                ; preds = %.prol.loopexit162.unr-lcssa
  br i1 %54, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %.prol.loopexit162
  br label %63

; <label>:63:                                     ; preds = %63, %.lr.ph47.split.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next124.1, %63 ]
  %64 = phi double [ %.unr165.ph, %.lr.ph47.split.us.new ], [ %78, %63 ]
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv123
  %66 = bitcast double* %65 to <2 x double>*
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %68 = load double, double* %67, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %69 = load <2 x double>, <2 x double>* %66, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %71 = load double, double* %70, align 8
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %71, i32 1
  %74 = fmul <2 x double> %69, %73
  %75 = extractelement <2 x double> %74, i32 0
  %76 = extractelement <2 x double> %74, i32 1
  %77 = fsub double %64, %75
  %78 = fsub double %77, %76
  %exitcond132.1 = icmp eq i64 %indvars.iv.next124, %wide.trip.count131
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  br i1 %exitcond132.1, label %._crit_edge41.us.unr-lcssa, label %63

._crit_edge41.us.unr-lcssa:                       ; preds = %63
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %.prol.loopexit162, %._crit_edge41.us.unr-lcssa
  %.lcssa150 = phi double [ %.lcssa150.unr.ph, %.prol.loopexit162 ], [ %78, %._crit_edge41.us.unr-lcssa ]
  store double %.lcssa150, double* %55, align 8
  %indvars.iv.next136 = add i64 %indvars.iv135, 1
  %79 = icmp slt i64 %indvars.iv.next136, %8
  br i1 %79, label %.lr.ph47.split.us, label %._crit_edge48.loopexit

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %.lr.ph47.split.preheader.new ], [ %indvars.iv.next119.7, %.lr.ph47.split ]
  %indvars.iv.next119.6 = add i64 %indvars.iv118, 7
  %exitcond121.7 = icmp eq i64 %indvars.iv.next119.6, %wide.trip.count120
  %indvars.iv.next119.7 = add i64 %indvars.iv118, 8
  br i1 %exitcond121.7, label %.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa, label %.lr.ph47.split

.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa: ; preds = %.lr.ph47.split
  br label %.lr.ph47.split.._crit_edge48_crit_edge

.lr.ph47.split.._crit_edge48_crit_edge:           ; preds = %.lr.ph47.split.prol.loopexit, %.lr.ph47.split.._crit_edge48_crit_edge.unr-lcssa
  br label %._crit_edge48

._crit_edge48.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %._crit_edge33, %.lr.ph47.split.._crit_edge48_crit_edge
  %indvars.iv.next138 = add i64 %indvars.iv137, 1
  %80 = icmp slt i64 %indvars.iv.next138, %8
  br i1 %80, label %10, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge48
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %5, %._crit_edge57
  br i1 %6, label %.lr.ph18, label %._crit_edge73.thread

._crit_edge73.thread:                             ; preds = %._crit_edge69
  br label %._crit_edge76

.lr.ph18:                                         ; preds = %._crit_edge69
  %81 = sext i32 %0 to i64
  br label %82

; <label>:82:                                     ; preds = %._crit_edge13, %.lr.ph18
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge13 ], [ 0, %.lr.ph18 ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %._crit_edge13 ], [ -1, %.lr.ph18 ]
  %83 = add i64 %indvars.iv102, 4294967295
  %84 = and i64 %83, 4294967295
  %85 = getelementptr inbounds double, double* %2, i64 %indvars.iv102
  %86 = load double, double* %85, align 8
  %87 = icmp sgt i64 %indvars.iv102, 0
  br i1 %87, label %.lr.ph12.preheader, label %._crit_edge13

.lr.ph12.preheader:                               ; preds = %82
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  %xtraiter151 = and i64 %indvars.iv102, 3
  %lcmp.mod152 = icmp eq i64 %xtraiter151, 0
  br i1 %lcmp.mod152, label %.lr.ph12.prol.loopexit, label %.lr.ph12.prol.preheader

.lr.ph12.prol.preheader:                          ; preds = %.lr.ph12.preheader
  br label %.lr.ph12.prol

.lr.ph12.prol:                                    ; preds = %.lr.ph12.prol, %.lr.ph12.prol.preheader
  %indvars.iv92.prol = phi i64 [ %indvars.iv.next93.prol, %.lr.ph12.prol ], [ 0, %.lr.ph12.prol.preheader ]
  %88 = phi double [ %94, %.lr.ph12.prol ], [ %86, %.lr.ph12.prol.preheader ]
  %prol.iter153 = phi i64 [ %prol.iter153.sub, %.lr.ph12.prol ], [ %xtraiter151, %.lr.ph12.prol.preheader ]
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92.prol
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds double, double* %4, i64 %indvars.iv92.prol
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fsub double %88, %93
  %indvars.iv.next93.prol = add nuw nsw i64 %indvars.iv92.prol, 1
  %prol.iter153.sub = add i64 %prol.iter153, -1
  %prol.iter153.cmp = icmp eq i64 %prol.iter153.sub, 0
  br i1 %prol.iter153.cmp, label %.lr.ph12.prol.loopexit.unr-lcssa, label %.lr.ph12.prol, !llvm.loop !29

.lr.ph12.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph12.prol
  br label %.lr.ph12.prol.loopexit

.lr.ph12.prol.loopexit:                           ; preds = %.lr.ph12.preheader, %.lr.ph12.prol.loopexit.unr-lcssa
  %.lcssa148.unr = phi double [ undef, %.lr.ph12.preheader ], [ %94, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %indvars.iv92.unr = phi i64 [ 0, %.lr.ph12.preheader ], [ %indvars.iv.next93.prol, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %.unr154 = phi double [ %86, %.lr.ph12.preheader ], [ %94, %.lr.ph12.prol.loopexit.unr-lcssa ]
  %95 = icmp ult i64 %84, 3
  br i1 %95, label %._crit_edge13.loopexit, label %.lr.ph12.preheader.new

.lr.ph12.preheader.new:                           ; preds = %.lr.ph12.prol.loopexit
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12, %.lr.ph12.preheader.new
  %indvars.iv92 = phi i64 [ %indvars.iv92.unr, %.lr.ph12.preheader.new ], [ %indvars.iv.next93.3, %.lr.ph12 ]
  %96 = phi double [ %.unr154, %.lr.ph12.preheader.new ], [ %118, %.lr.ph12 ]
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv92
  %98 = bitcast double* %97 to <2 x double>*
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv92
  %100 = bitcast double* %99 to <2 x double>*
  %101 = load <2 x double>, <2 x double>* %98, align 8
  %102 = load <2 x double>, <2 x double>* %100, align 8
  %103 = fmul <2 x double> %101, %102
  %104 = extractelement <2 x double> %103, i32 0
  %105 = extractelement <2 x double> %103, i32 1
  %106 = fsub double %96, %104
  %107 = fsub double %106, %105
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next93.1
  %109 = bitcast double* %108 to <2 x double>*
  %110 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next93.1
  %111 = bitcast double* %110 to <2 x double>*
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3
  %112 = load <2 x double>, <2 x double>* %109, align 8
  %113 = load <2 x double>, <2 x double>* %111, align 8
  %114 = fmul <2 x double> %112, %113
  %115 = extractelement <2 x double> %114, i32 0
  %116 = extractelement <2 x double> %114, i32 1
  %117 = fsub double %107, %115
  %118 = fsub double %117, %116
  %exitcond101.3 = icmp eq i64 %indvars.iv.next93.2, %wide.trip.count100
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4
  br i1 %exitcond101.3, label %._crit_edge13.loopexit.unr-lcssa, label %.lr.ph12

._crit_edge13.loopexit.unr-lcssa:                 ; preds = %.lr.ph12
  br label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %.lr.ph12.prol.loopexit, %._crit_edge13.loopexit.unr-lcssa
  %.lcssa148 = phi double [ %.lcssa148.unr, %.lr.ph12.prol.loopexit ], [ %118, %._crit_edge13.loopexit.unr-lcssa ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %82
  %.lcssa1624 = phi double [ %86, %82 ], [ %.lcssa148, %._crit_edge13.loopexit ]
  %119 = getelementptr inbounds double, double* %4, i64 %indvars.iv102
  store double %.lcssa1624, double* %119, align 8
  %indvars.iv.next103 = add i64 %indvars.iv102, 1
  %120 = icmp slt i64 %indvars.iv.next103, %81
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  br i1 %120, label %82, label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge13
  br i1 true, label %.lr.ph4, label %._crit_edge73.._crit_edge76_crit_edge

._crit_edge73.._crit_edge76_crit_edge:            ; preds = %._crit_edge73
  br label %._crit_edge76

.lr.ph4:                                          ; preds = %._crit_edge73
  %121 = add i32 %0, -1
  %122 = sext i32 %121 to i64
  %123 = add nsw i64 %122, 1
  br label %124

; <label>:124:                                    ; preds = %._crit_edge, %.lr.ph4
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph4 ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge ], [ %122, %.lr.ph4 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge ], [ %0, %.lr.ph4 ]
  %125 = sub i32 %0, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 %122, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv90
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv90, 1
  %131 = icmp slt i64 %130, %81
  br i1 %131, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %124
  %132 = sub nsw i64 %123, %126
  %133 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %132, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %134

; <label>:134:                                    ; preds = %134, %.prol.preheader
  %indvars.iv88.prol = phi i64 [ %indvars.iv.next89.prol, %134 ], [ %133, %.prol.preheader ]
  %135 = phi double [ %141, %134 ], [ %129, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %134 ], [ %xtraiter, %.prol.preheader ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88.prol
  %137 = load double, double* %136, align 8
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv88.prol
  %139 = load double, double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fsub double %135, %140
  %indvars.iv.next89.prol = add nsw i64 %indvars.iv88.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %134, !llvm.loop !30

.prol.loopexit.unr-lcssa:                         ; preds = %134
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %141, %.prol.loopexit.unr-lcssa ]
  %indvars.iv88.unr = phi i64 [ %133, %.lr.ph ], [ %indvars.iv.next89.prol, %.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %129, %.lr.ph ], [ %141, %.prol.loopexit.unr-lcssa ]
  %142 = icmp ult i64 %127, 3
  br i1 %142, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %143

; <label>:143:                                    ; preds = %143, %.lr.ph.new
  %indvars.iv88 = phi i64 [ %indvars.iv88.unr, %.lr.ph.new ], [ %indvars.iv.next89.3, %143 ]
  %144 = phi double [ %.unr, %.lr.ph.new ], [ %166, %143 ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv88
  %146 = bitcast double* %145 to <2 x double>*
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv88
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %146, align 8
  %150 = load <2 x double>, <2 x double>* %148, align 8
  %151 = fmul <2 x double> %149, %150
  %152 = extractelement <2 x double> %151, i32 0
  %153 = extractelement <2 x double> %151, i32 1
  %154 = fsub double %144, %152
  %155 = fsub double %154, %153
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv.next89.1
  %157 = bitcast double* %156 to <2 x double>*
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next89.1
  %159 = bitcast double* %158 to <2 x double>*
  %indvars.iv.next89.2 = add nsw i64 %indvars.iv88, 3
  %160 = load <2 x double>, <2 x double>* %157, align 8
  %161 = load <2 x double>, <2 x double>* %159, align 8
  %162 = fmul <2 x double> %160, %161
  %163 = extractelement <2 x double> %162, i32 0
  %164 = extractelement <2 x double> %162, i32 1
  %165 = fsub double %155, %163
  %166 = fsub double %165, %164
  %exitcond.3 = icmp eq i64 %indvars.iv.next89.2, %122
  %indvars.iv.next89.3 = add nsw i64 %indvars.iv88, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %143

._crit_edge.loopexit.unr-lcssa:                   ; preds = %143
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %166, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %124
  %.lcssa210 = phi double [ %129, %124 ], [ %.lcssa, %._crit_edge.loopexit ]
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv90, i64 %indvars.iv90
  %168 = load double, double* %167, align 8
  %169 = fdiv double %.lcssa210, %168
  %170 = getelementptr inbounds double, double* %3, i64 %indvars.iv90
  store double %169, double* %170, align 8
  %indvars.iv.next91 = add i64 %indvars.iv90, -1
  %171 = icmp sgt i64 %indvars.iv90, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %171, label %124, label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge73.._crit_edge76_crit_edge, %._crit_edge73.thread, %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !2}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = !{!16}
!16 = distinct !{!16, !12}
!17 = !{!14, !11}
!18 = distinct !{!18, !4, !5}
!19 = distinct !{!19, !4, !5}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !4, !5}
!26 = distinct !{!26, !2}
!27 = distinct !{!27, !4, !5}
!28 = distinct !{!28, !2}
!29 = distinct !{!29, !2}
!30 = distinct !{!30, !2}
