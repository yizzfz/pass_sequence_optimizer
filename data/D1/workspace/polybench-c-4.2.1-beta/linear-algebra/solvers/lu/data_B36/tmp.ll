; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.preheader15.lr.ph:
  %1 = alloca [2000 x double]*, align 8
  %2 = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %0, [2000 x double]** %1, align 8
  br label %.lr.ph54

.lr.ph54:                                         ; preds = %._crit_edge61..lr.ph54_crit_edge, %.preheader15.lr.ph
  %indvars.iv4 = phi i3 [ %indvars.iv.next5, %._crit_edge61..lr.ph54_crit_edge ], [ -1, %.preheader15.lr.ph ]
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %._crit_edge61..lr.ph54_crit_edge ], [ 2, %.preheader15.lr.ph ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge61..lr.ph54_crit_edge ], [ 0, %.preheader15.lr.ph ]
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge61..lr.ph54_crit_edge ], [ 1, %.preheader15.lr.ph ]
  %3 = zext i3 %indvars.iv4 to i64
  %4 = add nuw nsw i64 %3, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = add i64 %indvars.iv2, %5
  %7 = sub nsw i64 0, %indvars.iv145
  %8 = trunc i64 %7 to i32
  %9 = add i32 %8, 7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph54
  %indvars.iv126 = phi i64 [ 0, %.lr.ph54 ], [ %indvars.iv.next127, %._crit_edge ]
  %10 = sub nsw i64 0, %indvars.iv126
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv126
  store double %15, double* %16, align 8
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next127, %indvars.iv143
  br i1 %exitcond131, label %._crit_edge55, label %._crit_edge

._crit_edge55:                                    ; preds = %._crit_edge
  %17 = add i32 %8, 1998
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %18 = icmp slt i64 %indvars.iv.next146, 2000
  br i1 %18, label %.lr.ph60, label %._crit_edge61

.lr.ph60:                                         ; preds = %._crit_edge55
  %xtraiter140 = and i32 %9, 7
  %lcmp.mod141 = icmp eq i32 %xtraiter140, 0
  br i1 %lcmp.mod141, label %.prol.loopexit139, label %.prol.preheader138.preheader

.prol.preheader138.preheader:                     ; preds = %.lr.ph60
  br label %.prol.preheader138

.prol.preheader138:                               ; preds = %.prol.preheader138.preheader, %.prol.preheader138
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.prol.preheader138 ], [ %indvars.iv143, %.prol.preheader138.preheader ]
  %prol.iter142 = phi i32 [ %prol.iter142.sub, %.prol.preheader138 ], [ %xtraiter140, %.prol.preheader138.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv134.prol
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next135.prol = add nuw nsw i64 %indvars.iv134.prol, 1
  %prol.iter142.sub = add nsw i32 %prol.iter142, -1
  %prol.iter142.cmp = icmp eq i32 %prol.iter142.sub, 0
  br i1 %prol.iter142.cmp, label %.prol.loopexit139.loopexit, label %.prol.preheader138, !llvm.loop !1

.prol.loopexit139.loopexit:                       ; preds = %.prol.preheader138
  br label %.prol.loopexit139

.prol.loopexit139:                                ; preds = %.prol.loopexit139.loopexit, %.lr.ph60
  %indvars.iv134.unr = phi i64 [ %indvars.iv143, %.lr.ph60 ], [ %6, %.prol.loopexit139.loopexit ]
  %20 = icmp ult i32 %17, 7
  br i1 %20, label %._crit_edge61, label %.lr.ph60.new.preheader

.lr.ph60.new.preheader:                           ; preds = %.prol.loopexit139
  %21 = sub i64 1992, %indvars.iv134.unr
  %22 = lshr i64 %21, 3
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check = icmp ult i64 %23, 2
  br i1 %min.iters.check, label %.lr.ph60.new.preheader1, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph60.new.preheader
  %n.mod.vf = and i64 %23, 1
  %n.vec = sub nsw i64 %23, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %24 = add i64 %indvars.iv134.unr, 8
  %25 = shl nuw i64 %22, 3
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %26, %27
  br i1 %cmp.zero, label %.lr.ph60.new.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %28 = shl i64 %index, 3
  %29 = add i64 %indvars.iv134.unr, %28
  %30 = add nsw i64 %29, 7
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %30
  %32 = getelementptr double, double* %31, i64 -7
  %33 = bitcast double* %32 to <16 x double>*
  store <16 x double> zeroinitializer, <16 x double>* %33, align 8
  %index.next = add i64 %index, 2
  %34 = icmp eq i64 %index.next, %n.vec
  br i1 %34, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge61, label %.lr.ph60.new.preheader1

.lr.ph60.new.preheader1:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph60.new.preheader
  %indvars.iv134.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv134.unr, %min.iters.checked ], [ %indvars.iv134.unr, %.lr.ph60.new.preheader ]
  br label %.lr.ph60.new

.lr.ph60.new:                                     ; preds = %.lr.ph60.new.preheader1, %.lr.ph60.new
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.7, %.lr.ph60.new ], [ %indvars.iv134.ph, %.lr.ph60.new.preheader1 ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv134
  store double 0.000000e+00, double* %35, align 8
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135
  store double 0.000000e+00, double* %36, align 8
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135.1
  store double 0.000000e+00, double* %37, align 8
  %indvars.iv.next135.2 = add nsw i64 %indvars.iv134, 3
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135.2
  store double 0.000000e+00, double* %38, align 8
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135.3
  store double 0.000000e+00, double* %39, align 8
  %indvars.iv.next135.4 = add nsw i64 %indvars.iv134, 5
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135.4
  store double 0.000000e+00, double* %40, align 8
  %indvars.iv.next135.5 = add nsw i64 %indvars.iv134, 6
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135.5
  store double 0.000000e+00, double* %41, align 8
  %indvars.iv.next135.6 = add nsw i64 %indvars.iv134, 7
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv.next135.6
  store double 0.000000e+00, double* %42, align 8
  %indvars.iv.next135.7 = add nsw i64 %indvars.iv134, 8
  %exitcond137.7 = icmp eq i64 %indvars.iv.next135.7, 2000
  br i1 %exitcond137.7, label %._crit_edge61.loopexit, label %.lr.ph60.new, !llvm.loop !6

._crit_edge61.loopexit:                           ; preds = %.lr.ph60.new
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61.loopexit, %middle.block, %.prol.loopexit139, %._crit_edge55
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv145
  store double 1.000000e+00, double* %43, align 8
  %exitcond148 = icmp eq i64 %indvars.iv.next146, 2000
  br i1 %exitcond148, label %._crit_edge47.us.3.preheader, label %._crit_edge61..lr.ph54_crit_edge

._crit_edge61..lr.ph54_crit_edge:                 ; preds = %._crit_edge61
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %indvars.iv.next3 = add nuw i64 %indvars.iv2, 1
  %indvars.iv.next5 = add i3 %indvars.iv4, -1
  br label %.lr.ph54

._crit_edge47.us.3.preheader:                     ; preds = %._crit_edge61
  %44 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %45 = bitcast [2000 x [2000 x double]]** %2 to i8**
  store i8* %44, i8** %45, align 8
  %46 = bitcast i8* %44 to [2000 x [2000 x double]]*
  %47 = bitcast i8* %44 to [2000 x [2000 x double]]*
  br label %._crit_edge47.us.3

.preheader11.us.us.preheader:                     ; preds = %.preheader11.us.us.preheader.preheader, %._crit_edge27.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge27.us ], [ 0, %.preheader11.us.us.preheader.preheader ]
  br label %.preheader11.us.us.new.preheader

._crit_edge27.us:                                 ; preds = %._crit_edge25.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond111, label %.preheader.us.preheader, label %.preheader11.us.us.preheader

.preheader11.us.us.new.preheader:                 ; preds = %._crit_edge25.us.us, %.preheader11.us.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader11.us.us.preheader ], [ %indvars.iv.next105, %._crit_edge25.us.us ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv108
  br label %.preheader11.us.us.new

._crit_edge25.us.us:                              ; preds = %.preheader11.us.us.new
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond107, label %._crit_edge27.us, label %.preheader11.us.us.new.preheader

.preheader11.us.us.new:                           ; preds = %.preheader11.us.us.new, %.preheader11.us.us.new.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader11.us.us.new.preheader ], [ %indvars.iv.next97.1, %.preheader11.us.us.new ]
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv96, i64 %indvars.iv108
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv104, i64 %indvars.iv96
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  store double %55, double* %53, align 8
  %indvars.iv.next97 = or i64 %indvars.iv96, 1
  %56 = load double, double* %48, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next97, i64 %indvars.iv108
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next97
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  store double %62, double* %60, align 8
  %indvars.iv.next97.1 = add nuw nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, 2000
  br i1 %exitcond99.1, label %._crit_edge25.us.us, label %.preheader11.us.us.new

.preheader.us.preheader:                          ; preds = %._crit_edge27.us
  %63 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %2, align 8
  %64 = load [2000 x double]*, [2000 x double]** %1, align 8
  br label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next92, %._crit_edge.us ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.new.preheader ], [ %indvars.iv.next.3, %.preheader.us.new ]
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i64 %indvars.iv91, i64 %indvars.iv
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i64 %indvars.iv91, i64 %indvars.iv.next
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %63, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond, label %85, label %.preheader.us.new.preheader

; <label>:85:                                     ; preds = %._crit_edge.us
  %86 = bitcast [2000 x [2000 x double]]* %63 to i8*
  tail call void @free(i8* %86) #4
  ret void

._crit_edge47.us.3:                               ; preds = %._crit_edge47.us.3, %._crit_edge47.us.3.preheader
  %indvars.iv118 = phi i64 [ 0, %._crit_edge47.us.3.preheader ], [ %indvars.iv.next119.3.1, %._crit_edge47.us.3 ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv118, i64 0
  %scevgep117 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv.next119, i64 0
  %scevgep117.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv.next119.1, i64 0
  %scevgep117.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv.next119.2, i64 0
  %scevgep117.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %scevgep.16 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv.next119.3, i64 0
  %scevgep117.17 = bitcast double* %scevgep.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.17, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.18 = or i64 %indvars.iv118, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv.next119.18, i64 0
  %scevgep117.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1.1 = or i64 %indvars.iv118, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv.next119.1.1, i64 0
  %scevgep117.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2.1 = or i64 %indvars.iv118, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv.next119.2.1, i64 0
  %scevgep117.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep117.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3.1 = add nsw i64 %indvars.iv118, 8
  %exitcond121.3.1 = icmp eq i64 %indvars.iv.next119.3.1, 2000
  br i1 %exitcond121.3.1, label %.preheader11.us.us.preheader.preheader, label %._crit_edge47.us.3

.preheader11.us.us.preheader.preheader:           ; preds = %._crit_edge47.us.3
  %87 = bitcast i8* %44 to [2000 x [2000 x double]]*
  br label %.preheader11.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
.preheader6.preheader:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16, %.preheader6.preheader
  %indvars.iv74 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next75, %._crit_edge16 ]
  %1 = add nuw nsw i64 %indvars.iv74, 4294967295
  %2 = icmp sgt i64 %indvars.iv74, 0
  br i1 %2, label %.preheader5.preheader, label %._crit_edge16

.preheader5.preheader:                            ; preds = %.preheader6
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 0
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge, %.preheader5.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next47, %._crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv46, 4294967295
  %5 = icmp sgt i64 %indvars.iv46, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv46
  %.pre = load double, double* %6, align 8
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter79 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter79, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %7

; <label>:7:                                      ; preds = %.lr.ph
  %8 = load double, double* %3, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv46
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fsub double %.pre, %11
  store double %12, double* %6, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %7
  %indvars.iv.unr.ph = phi i64 [ 1, %7 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %12, %7 ], [ %.pre, %.lr.ph ]
  %.lcssa37.unr.ph = phi double [ %12, %7 ], [ undef, %.lr.ph ]
  %13 = trunc i64 %4 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %15 = phi double [ %27, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv46
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv46
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %6, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader5
  %28 = phi double [ %.pre, %.preheader5 ], [ %.lcssa37.unr.ph, %.prol.loopexit ], [ %27, %._crit_edge.loopexit ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  %30 = load double, double* %29, align 8
  %31 = fdiv double %28, %30
  store double %31, double* %6, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv74
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader5

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6178 = and i64 %indvars.iv74, 1
  %32 = trunc i64 %1 to i32
  %33 = icmp eq i64 %xtraiter6178, 0
  %34 = icmp eq i32 %32, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us, %.preheader.us.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv74, %.preheader.us.preheader ], [ %indvars.iv.next67, %._crit_edge13.us ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv66
  %.pre33 = load double, double* %35, align 8
  br i1 %33, label %.prol.loopexit60, label %36

; <label>:36:                                     ; preds = %.preheader.us
  %37 = load double, double* %3, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv66
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %.pre33, %40
  store double %41, double* %35, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.preheader.us, %36
  %indvars.iv52.unr.ph = phi i64 [ 1, %36 ], [ 0, %.preheader.us ]
  %.unr63.ph = phi double [ %41, %36 ], [ %.pre33, %.preheader.us ]
  br i1 %34, label %._crit_edge13.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit60
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.preheader.us.new ], [ %indvars.iv52.unr.ph, %.preheader.us.new.preheader ]
  %42 = phi double [ %54, %.preheader.us.new ], [ %.unr63.ph, %.preheader.us.new.preheader ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv52
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv66
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %35, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv74, i64 %indvars.iv.next53
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv66
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  store double %54, double* %35, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next53.1, %indvars.iv74
  br i1 %exitcond58.1, label %._crit_edge13.us.loopexit, label %.preheader.us.new

._crit_edge13.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit60
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next67, 2000
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %.preheader.us

._crit_edge16.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond77, label %._crit_edge21, label %.preheader6

._crit_edge21:                                    ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge1

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond11, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
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
