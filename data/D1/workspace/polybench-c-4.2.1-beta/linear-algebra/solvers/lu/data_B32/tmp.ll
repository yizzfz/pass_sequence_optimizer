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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader62.lr.ph, label %._crit_edge90.thread

._crit_edge90.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge65

.preheader62.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count136 = zext i32 %0 to i64
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %._crit_edge88, %.preheader62.lr.ph
  %indvars.iv134 = phi i64 [ 0, %.preheader62.lr.ph ], [ %9, %._crit_edge88 ]
  %indvars.iv132 = phi i64 [ 1, %.preheader62.lr.ph ], [ %indvars.iv.next133, %._crit_edge88 ]
  %9 = add nuw nsw i64 %indvars.iv134, 1
  %10 = sub i64 %7, %indvars.iv134
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  br label %16

.preheader61:                                     ; preds = %16
  %13 = icmp slt i64 %9, %8
  br i1 %13, label %.lr.ph87.preheader, label %._crit_edge88

.lr.ph87.preheader:                               ; preds = %.preheader61
  %14 = add nuw nsw i64 %12, 8
  %scevgep129 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %9
  %15 = mul nuw nsw i64 %indvars.iv134, 2000
  %scevgep130 = getelementptr double, double* %scevgep129, i64 %15
  %scevgep130131 = bitcast double* %scevgep130 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep130131, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge88

; <label>:16:                                     ; preds = %16, %.lr.ph84
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %16 ], [ 0, %.lr.ph84 ]
  %17 = sub nsw i64 0, %indvars.iv117
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %5
  %22 = fadd double %21, 1.000000e+00
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv117
  store double %22, double* %23, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next118, %indvars.iv132
  br i1 %exitcond122, label %.preheader61, label %16

._crit_edge88:                                    ; preds = %.lr.ph87.preheader, %.preheader61
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv134, i64 %indvars.iv134
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond137 = icmp eq i64 %9, %wide.trip.count136
  br i1 %exitcond137, label %.preheader60.us.preheader, label %.lr.ph84

.preheader60.us.preheader:                        ; preds = %._crit_edge88
  %25 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %26 = add i32 %0, -1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 3
  %29 = add nuw nsw i64 %28, 8
  %30 = add nsw i64 %wide.trip.count136, -1
  %xtraiter142 = and i64 %wide.trip.count136, 3
  %lcmp.mod143 = icmp eq i64 %xtraiter142, 0
  br i1 %lcmp.mod143, label %.preheader60.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %.preheader60.us.preheader
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol.preheader, %._crit_edge81.us.prol
  %indvars.iv113.prol = phi i64 [ %indvars.iv.next114.prol, %._crit_edge81.us.prol ], [ 0, %._crit_edge81.us.prol.preheader ]
  %prol.iter144 = phi i64 [ %prol.iter144.sub, %._crit_edge81.us.prol ], [ %xtraiter142, %._crit_edge81.us.prol.preheader ]
  %31 = mul nuw nsw i64 %indvars.iv113.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %25, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next114.prol = add nuw nsw i64 %indvars.iv113.prol, 1
  %prol.iter144.sub = add nsw i64 %prol.iter144, -1
  %prol.iter144.cmp = icmp eq i64 %prol.iter144.sub, 0
  br i1 %prol.iter144.cmp, label %.preheader60.us.prol.loopexit.loopexit, label %._crit_edge81.us.prol, !llvm.loop !1

.preheader60.us.prol.loopexit.loopexit:           ; preds = %._crit_edge81.us.prol
  br label %.preheader60.us.prol.loopexit

.preheader60.us.prol.loopexit:                    ; preds = %.preheader60.us.prol.loopexit.loopexit, %.preheader60.us.preheader
  %indvars.iv113.unr = phi i64 [ 0, %.preheader60.us.preheader ], [ %xtraiter142, %.preheader60.us.prol.loopexit.loopexit ]
  %32 = icmp ult i64 %30, 3
  br i1 %32, label %.preheader57.us.us.preheader.preheader, label %._crit_edge81.us.3.preheader

._crit_edge81.us.3.preheader:                     ; preds = %.preheader60.us.prol.loopexit
  %33 = add nsw i64 %wide.trip.count136, -4
  %34 = sub nsw i64 %33, %indvars.iv113.unr
  %35 = lshr i64 %34, 2
  %36 = and i64 %35, 1
  %lcmp.mod = icmp eq i64 %36, 0
  br i1 %lcmp.mod, label %._crit_edge81.us.3.prol.preheader, label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.preheader:                ; preds = %._crit_edge81.us.3.preheader
  br label %._crit_edge81.us.3.prol

._crit_edge81.us.3.prol:                          ; preds = %._crit_edge81.us.3.prol.preheader
  %37 = mul nuw nsw i64 %indvars.iv113.unr, 16000
  %scevgep.prol150 = getelementptr i8, i8* %25, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol150, i8 0, i64 %29, i32 8, i1 false)
  %38 = add nuw nsw i64 %37, 16000
  %scevgep.1.prol = getelementptr i8, i8* %25, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %29, i32 8, i1 false)
  %39 = add nuw nsw i64 %37, 32000
  %scevgep.2.prol = getelementptr i8, i8* %25, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %29, i32 8, i1 false)
  %40 = add nuw nsw i64 %37, 48000
  %scevgep.3.prol = getelementptr i8, i8* %25, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next114.3.prol = or i64 %indvars.iv113.unr, 4
  br label %._crit_edge81.us.3.prol.loopexit

._crit_edge81.us.3.prol.loopexit:                 ; preds = %._crit_edge81.us.3.prol, %._crit_edge81.us.3.preheader
  %indvars.iv113.unr151 = phi i64 [ %indvars.iv113.unr, %._crit_edge81.us.3.preheader ], [ %indvars.iv.next114.3.prol, %._crit_edge81.us.3.prol ]
  %41 = icmp eq i64 %35, 0
  br i1 %41, label %.preheader57.us.us.preheader.preheader.loopexit, label %._crit_edge81.us.3.preheader.new

._crit_edge81.us.3.preheader.new:                 ; preds = %._crit_edge81.us.3.prol.loopexit
  br label %._crit_edge81.us.3

.preheader57.us.us.preheader.preheader.loopexit.unr-lcssa: ; preds = %._crit_edge81.us.3
  br label %.preheader57.us.us.preheader.preheader.loopexit

.preheader57.us.us.preheader.preheader.loopexit:  ; preds = %._crit_edge81.us.3.prol.loopexit, %.preheader57.us.us.preheader.preheader.loopexit.unr-lcssa
  br label %.preheader57.us.us.preheader.preheader

.preheader57.us.us.preheader.preheader:           ; preds = %.preheader57.us.us.preheader.preheader.loopexit, %.preheader60.us.prol.loopexit
  %42 = and i32 %0, 1
  %43 = icmp eq i32 %42, 0
  %44 = icmp eq i32 %0, 1
  %45 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %46 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader57.us.us.preheader

.preheader57.us.us.preheader:                     ; preds = %.preheader57.us.us.preheader.preheader, %._crit_edge70.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge70.us ], [ 0, %.preheader57.us.us.preheader.preheader ]
  %sunkaddr146 = shl i64 %indvars.iv105, 3
  %sunkaddr147 = add i64 %sunkaddr, %sunkaddr146
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to double*
  br label %.preheader57.us.us

._crit_edge70.us:                                 ; preds = %._crit_edge68.us.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %wide.trip.count136
  br i1 %exitcond108, label %.preheader.us.preheader, label %.preheader57.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge70.us
  %47 = icmp eq i64 %xtraiter142, 0
  %48 = icmp ult i64 %30, 3
  %49 = bitcast i8* %25 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %25 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader57.us.us:                               ; preds = %._crit_edge68.us.us, %.preheader57.us.us.preheader
  %indvars.iv101 = phi i64 [ 0, %.preheader57.us.us.preheader ], [ %indvars.iv.next102, %._crit_edge68.us.us ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101, i64 %indvars.iv105
  br i1 %43, label %.prol.loopexit139, label %52

; <label>:52:                                     ; preds = %.preheader57.us.us
  %53 = load double, double* %51, align 8
  %54 = load double, double* %sunkaddr148, align 8
  %55 = fmul double %53, %54
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv101, i64 0
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %56, align 8
  br label %.prol.loopexit139

.prol.loopexit139:                                ; preds = %.preheader57.us.us, %52
  %indvars.iv97.unr.ph = phi i64 [ 1, %52 ], [ 0, %.preheader57.us.us ]
  br i1 %44, label %._crit_edge68.us.us, label %.preheader57.us.us.new.preheader

.preheader57.us.us.new.preheader:                 ; preds = %.prol.loopexit139
  br label %.preheader57.us.us.new

._crit_edge68.us.us.loopexit:                     ; preds = %.preheader57.us.us.new
  br label %._crit_edge68.us.us

._crit_edge68.us.us:                              ; preds = %._crit_edge68.us.us.loopexit, %.prol.loopexit139
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next102, %wide.trip.count136
  br i1 %exitcond104, label %._crit_edge70.us, label %.preheader57.us.us

.preheader57.us.us.new:                           ; preds = %.preheader57.us.us.new.preheader, %.preheader57.us.us.new
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %.preheader57.us.us.new ], [ %indvars.iv97.unr.ph, %.preheader57.us.us.new.preheader ]
  %59 = load double, double* %51, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv97, i64 %indvars.iv105
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %63, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %66 = load double, double* %51, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next98, i64 %indvars.iv105
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %71 = load double, double* %70, align 8
  %72 = fadd double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next98.1 = add nuw nsw i64 %indvars.iv97, 2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98.1, %wide.trip.count136
  br i1 %exitcond100.1, label %._crit_edge68.us.us.loopexit, label %.preheader57.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %47, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter142, %.prol.preheader.preheader ]
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv93, i64 %indvars.iv.prol
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.prol
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %xtraiter142, %.prol.loopexit.loopexit ]
  br i1 %48, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count136
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count136
  br i1 %exitcond96, label %._crit_edge65.loopexit, label %.preheader.us

._crit_edge65.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.loopexit, %._crit_edge90.thread
  %98 = phi i8* [ %4, %._crit_edge90.thread ], [ %25, %._crit_edge65.loopexit ]
  tail call void @free(i8* %98) #4
  ret void

._crit_edge81.us.3:                               ; preds = %._crit_edge81.us.3, %._crit_edge81.us.3.preheader.new
  %indvars.iv113 = phi i64 [ %indvars.iv113.unr151, %._crit_edge81.us.3.preheader.new ], [ %indvars.iv.next114.3.1, %._crit_edge81.us.3 ]
  %99 = mul i64 %indvars.iv113, 16000
  %scevgep = getelementptr i8, i8* %25, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %100 = add i64 %99, 16000
  %scevgep.1 = getelementptr i8, i8* %25, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %29, i32 8, i1 false)
  %101 = add i64 %99, 32000
  %scevgep.2 = getelementptr i8, i8* %25, i64 %101
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %29, i32 8, i1 false)
  %102 = add i64 %99, 48000
  %scevgep.3 = getelementptr i8, i8* %25, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %29, i32 8, i1 false)
  %103 = mul i64 %indvars.iv113, 16000
  %104 = add i64 %103, 64000
  %scevgep.1152 = getelementptr i8, i8* %25, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1152, i8 0, i64 %29, i32 8, i1 false)
  %105 = add i64 %103, 80000
  %scevgep.1.1 = getelementptr i8, i8* %25, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %29, i32 8, i1 false)
  %106 = add i64 %103, 96000
  %scevgep.2.1 = getelementptr i8, i8* %25, i64 %106
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %29, i32 8, i1 false)
  %107 = add i64 %103, 112000
  %scevgep.3.1 = getelementptr i8, i8* %25, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %29, i32 8, i1 false)
  %indvars.iv.next114.3.1 = add nsw i64 %indvars.iv113, 8
  %exitcond116.3.1 = icmp eq i64 %indvars.iv.next114.3.1, %wide.trip.count136
  br i1 %exitcond116.3.1, label %.preheader57.us.us.preheader.preheader.loopexit.unr-lcssa, label %._crit_edge81.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader35.preheader, label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  %wide.trip.count74 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %._crit_edge42
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge42 ], [ 0, %.preheader35.preheader ]
  %4 = icmp sgt i64 %indvars.iv72, 0
  br i1 %4, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter79 = and i64 %indvars.iv72, 1
  %6 = icmp eq i64 %xtraiter79, 0
  %7 = icmp eq i64 %indvars.iv72, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge40.us ], [ %indvars.iv72, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv68
  %.pre50 = load double, double* %8, align 8
  br i1 %6, label %.prol.loopexit78, label %9

; <label>:9:                                      ; preds = %.preheader.us
  %10 = load double, double* %5, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv68
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre50, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.preheader.us, %9
  %indvars.iv61.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us ]
  %.unr81.ph = phi double [ %14, %9 ], [ %.pre50, %.preheader.us ]
  br i1 %7, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit78
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.preheader.us.new ], [ %indvars.iv61.unr.ph, %.preheader.us.new.preheader ]
  %15 = phi double [ %27, %.preheader.us.new ], [ %.unr81.ph, %.preheader.us.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv61
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv68
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next62
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next62, i64 %indvars.iv68
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %8, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next62.1, %indvars.iv72
  br i1 %exitcond65.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit78
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count74
  br i1 %exitcond71, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %28 = icmp sgt i64 %indvars.iv54, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv54
  %.pre = load double, double* %29, align 8
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter = and i64 %indvars.iv54, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph
  %31 = load double, double* %5, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv54
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.pre, %34
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %30
  %indvars.iv.unr.ph = phi i64 [ 1, %30 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %35, %30 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %35, %30 ], [ undef, %.lr.ph ]
  %36 = icmp eq i64 %indvars.iv54, 1
  br i1 %36, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %37 = phi double [ %49, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv54
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %37, %42
  store double %43, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv54
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv54
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33, %.prol.loopexit
  %50 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader33 ], [ %49, %._crit_edge.loopexit ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv54
  %52 = load double, double* %51, align 8
  %53 = fdiv double %50, %52
  store double %53, double* %29, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %indvars.iv72
  br i1 %exitcond59, label %.preheader.us.preheader, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %._crit_edge46.loopexit, label %.preheader35

._crit_edge46.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv12, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count
  br i1 %exitcond15, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
